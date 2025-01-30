import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClientMapSeekerState extends Equatable {
  final Completer<GoogleMapController>? controller;
  final Position? position;

  ClientMapSeekerState({this.position, this.controller});

  ClientMapSeekerState copyWith({
    Position? position,
    Completer<GoogleMapController>? controller,
  }) {
    return ClientMapSeekerState(
        position: position ?? this.position, controller: controller);
  }

  @override
  List<Object?> get props => [position];
}
