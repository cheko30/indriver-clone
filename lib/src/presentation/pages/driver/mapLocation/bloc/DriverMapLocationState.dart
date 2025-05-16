import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/domain/models/PlacemarkData.dart';

class DriverMapLocationState extends Equatable {
  final Completer<GoogleMapController>? controller;
  final Position? position;
  final Map<MarkerId, Marker>? markers;
  final CameraPosition cameraPosition;

  DriverMapLocationState({
    this.position,
    this.controller,
    this.markers = const <MarkerId, Marker>{},
    this.cameraPosition = const CameraPosition(
        target: LatLng(19.424346612813117, -99.08432280105896), zoom: 15.0),
  });

  DriverMapLocationState copyWith({
    Position? position,
    Completer<GoogleMapController>? controller,
    Map<MarkerId, Marker>? markers,
    CameraPosition? cameraPosition,
    PlacemarkData? placemarkData,
    LatLng? pickUpLatLng,
    LatLng? destinationLatLng,
    String? pickUpDescription,
    String? destinationDescription,
  }) {
    return DriverMapLocationState(
      position: position ?? this.position,
      markers: markers ?? this.markers,
      controller: controller ?? this.controller,
      cameraPosition: cameraPosition ?? this.cameraPosition,
    );
  }

  @override
  List<Object?> get props => [
        position,
        markers,
        controller,
        cameraPosition,
      ];
}
