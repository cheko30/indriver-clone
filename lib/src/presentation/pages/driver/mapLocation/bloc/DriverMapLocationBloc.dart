import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationState.dart';

class DriverMapLocationBloc
    extends Bloc<DriverMapLocationEvent, DriverMapLocationState> {
  GeolocatorUseCases geolocatorUseCases;
  StreamSubscription? positionSubscription;

  DriverMapLocationBloc(this.geolocatorUseCases)
      : super(DriverMapLocationState()) {
    on<DriverMapLocationInitEvent>((event, emit) {
      Completer<GoogleMapController> controller =
          Completer<GoogleMapController>();
      emit(state.copyWith(controller: controller));
    });

    on<FindPosition>((event, emit) async {
      Position position = await geolocatorUseCases.findPosition.run();
      add(ChangeMapCameraPosition(
          lat: position.latitude, lng: position.longitude));
      add(AddMyPositionMarker(lat: position.latitude, lng: position.longitude));
      Stream<Position> positionStream =
          geolocatorUseCases.getPositionStream.run();
      positionSubscription = positionStream.listen((Position position) {
        add(UpdateLocation(position: position));
      });

      emit(state.copyWith(
        position: position,
      ));
    });

    on<AddMyPositionMarker>((event, emit) async {
      BitmapDescriptor descriptor =
          await geolocatorUseCases.createMarker.run('assets/img/car_pin.png');
      Marker marker = geolocatorUseCases.getMarker.run(
        'my_location',
        event.lat,
        event.lng,
        'Mi posicioón',
        '',
        descriptor,
      );
      emit(state.copyWith(
        markers: {marker.markerId: marker},
      ));
    });

    on<ChangeMapCameraPosition>((event, emit) async {
      GoogleMapController googleMapController = await state.controller!.future;
      await googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.lat, event.lng), zoom: 13, bearing: 0)));
    });

    on<UpdateLocation>((event, emit) async {
      print(
          "ACTULIZACION DE LOCALIZACION LAT: ${event.position.latitude} LNG: ${event.position.longitude}");
      add(AddMyPositionMarker(
          lat: event.position.latitude, lng: event.position.longitude));
      add(ChangeMapCameraPosition(
          lat: event.position.latitude, lng: event.position.longitude));
      emit(state.copyWith(
        position: event.position,
      ));
    });

    on<StopLocation>((event, emit) {
      positionSubscription?.cancel();
    });
  }
}
