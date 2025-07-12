import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/domain/models/PlacemarkData.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DriverMapLocationState extends Equatable {
  final Completer<GoogleMapController>? controller;
  final Position? position;
  final Map<MarkerId, Marker>? markers;
  final CameraPosition cameraPosition;
  final Socket? socket;
  final int? idDriver;

  DriverMapLocationState({
    this.position,
    this.controller,
    this.markers = const <MarkerId, Marker>{},
    this.cameraPosition = const CameraPosition(
        target: LatLng(19.424346612813117, -99.08432280105896), zoom: 15.0),
    this.socket,
    this.idDriver,
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
    Socket? socket,
    int? idDriver,
  }) {
    return DriverMapLocationState(
      position: position ?? this.position,
      markers: markers ?? this.markers,
      controller: controller ?? this.controller,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      socket: socket ?? this.socket,
      idDriver: idDriver ?? this.idDriver,
    );
  }

  @override
  List<Object?> get props =>
      [position, markers, controller, cameraPosition, socket, idDriver];
}
