import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerState.dart';

class ClientMapSeekerBloc
    extends Bloc<ClientMapSeekerEvent, ClientMapSeekerState> {
  GeolocatorUseCases geolocatorUseCases;
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  ClientMapSeekerBloc(this.geolocatorUseCases) : super(ClientMapSeekerState()) {
    on<ClientMapSeekerInitEvent>((event, emit) {
      emit(state.copyWith(controller: controller));
    });

    on<FindPosition>((event, emit) async {
      Position position = await geolocatorUseCases.findPosition.run();
      add(ChangeMapCameraPosition(
          lat: position.latitude, lng: position.longitude));

      BitmapDescriptor imageMarker =
          await geolocatorUseCases.createMarker.run('assets/img/alfiler.png');

      Marker marker = geolocatorUseCases.getMarker.run(
        'MyLocation',
        position.latitude,
        position.longitude,
        'Mi Posicion',
        '',
        imageMarker,
      );

      emit(state.copyWith(
        position: position,
        markers: {marker.markerId: marker},
        controller: controller,
      ));
    });

    on<ChangeMapCameraPosition>((event, emit) async {
      GoogleMapController googleMapController = await state.controller!.future;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.lat, event.lng), zoom: 13, bearing: 0)));
    });
  }
}
