import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/bitmap.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker.dart';
import 'package:indrive_clone_flutter/src/domain/models/PlacemarkData.dart';
import 'package:indrive_clone_flutter/src/domain/repository/GeolocatorRepository.dart';

class GeolocatorRepositoryImpl implements GeolocatorRepository {
  @override
  Future<Position> findPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<BitmapDescriptor> createMarkerFromAsset(String path) async {
    ImageConfiguration configuration = ImageConfiguration();
    BitmapDescriptor descriptor =
        await BitmapDescriptor.asset(configuration, path);
    return descriptor;
  }

  @override
  Marker getMarker(String markerId, double lat, double lng, String title,
      String content, BitmapDescriptor imageMarker) {
    MarkerId id = MarkerId(markerId);
    Marker marker = Marker(
      markerId: id,
      icon: imageMarker,
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(title: title, snippet: content),
    );

    return marker;
  }

  @override
  Future<PlacemarkData?> getPlacemarkData(CameraPosition cameraPosition) async {
    double lat = cameraPosition.target.latitude;
    double lng = cameraPosition.target.longitude;
    try {
      List<Placemark> placemarkList = await placemarkFromCoordinates(lat, lng);
      if (placemarkList != null) {
        if (placemarkList.length > 0) {
          String direction = placemarkList[0].thoroughfare!;
          String street = placemarkList[0].subThoroughfare!;
          String city = placemarkList[0].locality!;
          String department = placemarkList[0].administrativeArea!;
          PlacemarkData placemarkData = PlacemarkData(
              address: '$direction, $street, $city, $department',
              lat: lat,
              lng: lng);
          return placemarkData;
        }
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
