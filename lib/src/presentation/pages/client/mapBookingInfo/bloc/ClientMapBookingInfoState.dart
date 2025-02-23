import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/domain/models/PlacemarkData.dart';

class ClientMapBookingInfoState extends Equatable {
  final Completer<GoogleMapController>? controller;
  final Position? position;
  final CameraPosition cameraPosition;
  final Map<MarkerId, Marker> markers;
  final Map<PolylineId, Polyline> polylines;
  final LatLng? pickUpLatLng;
  final LatLng? destinationLatLng;
  final String pickUpDescription;
  final String destinationDescription;

  ClientMapBookingInfoState(
      {this.position,
      this.controller,
      this.cameraPosition = const CameraPosition(
          target: LatLng(19.424346612813117, -99.08432280105896), zoom: 15.0),
      this.pickUpLatLng,
      this.destinationLatLng,
      this.pickUpDescription = '',
      this.destinationDescription = '',
      this.markers = const <MarkerId, Marker>{},
      this.polylines = const <PolylineId, Polyline>{}});

  ClientMapBookingInfoState copyWith(
      {Position? position,
      Completer<GoogleMapController>? controller,
      CameraPosition? cameraPosition,
      LatLng? pickUpLatLng,
      LatLng? destinationLatLng,
      String? pickUpDescription,
      String? destinationDescription,
      Map<MarkerId, Marker>? markers,
      Map<PolylineId, Polyline>? polylines}) {
    return ClientMapBookingInfoState(
      position: position ?? this.position,
      markers: markers ?? this.markers,
      controller: controller ?? this.controller,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      pickUpLatLng: pickUpLatLng ?? this.pickUpLatLng,
      destinationLatLng: destinationLatLng ?? this.destinationLatLng,
      pickUpDescription: pickUpDescription ?? this.pickUpDescription,
      destinationDescription:
          destinationDescription ?? this.destinationDescription,
      polylines: polylines ?? this.polylines,
    );
  }

  @override
  List<Object?> get props => [
        position,
        markers,
        controller,
        cameraPosition,
        pickUpLatLng,
        destinationLatLng,
        pickUpDescription,
        destinationDescription,
        polylines
      ];
}
