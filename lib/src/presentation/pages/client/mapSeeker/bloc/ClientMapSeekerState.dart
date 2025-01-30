import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClientMapSeekerState extends Equatable {
  final Completer<GoogleMapController>? controller;
  final Position? position;
  final Map<MarkerId, Marker>? markers;

  ClientMapSeekerState(
      {this.position,
      this.controller,
      this.markers = const <MarkerId, Marker>{}});

  ClientMapSeekerState copyWith({
    Position? position,
    Completer<GoogleMapController>? controller,
    Map<MarkerId, Marker>? markers,
  }) {
    return ClientMapSeekerState(
      position: position ?? this.position,
      markers: markers ?? this.markers,
      controller: controller,
    );
  }

  @override
  List<Object?> get props => [position, markers];
}
