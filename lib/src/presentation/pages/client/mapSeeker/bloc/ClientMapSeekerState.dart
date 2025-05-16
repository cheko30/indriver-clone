import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/domain/models/PlacemarkData.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ClientMapSeekerState extends Equatable {
  final Completer<GoogleMapController>? controller;
  final Position? position;
  final Map<MarkerId, Marker>? markers;
  final CameraPosition cameraPosition;
  final PlacemarkData? placemarkData;
  final LatLng? pickUpLatLng;
  final LatLng? destinationLatLng;
  final String pickUpDescription;
  final String destinationDescription;
  final Socket? socket;

  ClientMapSeekerState(
      {this.position,
      this.controller,
      this.markers = const <MarkerId, Marker>{},
      this.cameraPosition = const CameraPosition(
          target: LatLng(19.424346612813117, -99.08432280105896), zoom: 15.0),
      this.placemarkData,
      this.pickUpLatLng,
      this.destinationLatLng,
      this.pickUpDescription = '',
      this.destinationDescription = '',
      this.socket});

  ClientMapSeekerState copyWith({
    Position? position,
    Completer<GoogleMapController>? controller,
    Map<MarkerId, Marker>? markers,
    CameraPosition? cameraPosition,
    PlacemarkData? placemarkData,
    LatLng? pickUpLatLng,
    LatLng? destinationLatLng,
    String? pickUpDescription,
    String? destinationDescription,
    Socket? socket,
  }) {
    return ClientMapSeekerState(
      position: position ?? this.position,
      markers: markers ?? this.markers,
      controller: controller ?? this.controller,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      placemarkData: placemarkData ?? this.placemarkData,
      pickUpLatLng: pickUpLatLng ?? this.pickUpLatLng,
      destinationLatLng: destinationLatLng ?? this.destinationLatLng,
      pickUpDescription: pickUpDescription ?? this.pickUpDescription,
      destinationDescription:
          destinationDescription ?? this.destinationDescription,
      socket: socket ?? this.socket,
    );
  }

  @override
  List<Object?> get props => [
        position,
        markers,
        controller,
        cameraPosition,
        placemarkData,
        pickUpLatLng,
        destinationLatLng,
        pickUpDescription,
        destinationDescription,
        socket,
      ];
}
