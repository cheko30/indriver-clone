import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/domain/models/AuthResponse.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/socket/SocketUseCases.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationState.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DriverMapLocationBloc
    extends Bloc<DriverMapLocationEvent, DriverMapLocationState> {
  SocketUseCases socketUseCases;
  GeolocatorUseCases geolocatorUseCases;
  StreamSubscription? positionSubscription;
  AuthUseCases authUseCases;

  DriverMapLocationBloc(
      this.geolocatorUseCases, this.socketUseCases, this.authUseCases)
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
      add(AddMyPositionMarker(
          lat: event.position.latitude, lng: event.position.longitude));
      add(ChangeMapCameraPosition(
          lat: event.position.latitude, lng: event.position.longitude));
      emit(state.copyWith(
        position: event.position,
      ));
      add(EmitDrivePositionSocketIO());
    });

    on<StopLocation>((event, emit) {
      positionSubscription?.cancel();
    });

    on<ConnectSocketIO>((event, emit) {
      Socket socket = socketUseCases.connect.run();
      emit(
        state.copyWith(socket: socket),
      );
    });

    on<DisconnectSocketIO>((event, emit) {
      Socket socket = socketUseCases.disconnect.run();
      emit(
        state.copyWith(socket: socket),
      );
    });

    on<EmitDrivePositionSocketIO>((event, emit) async {
      AuthResponse authResponse = await authUseCases.getUserSession.run();
      state.socket?.emit('change_driver_position', {
        'id': authResponse.user.id,
        'lat': state.position!.latitude,
        'lng': state.position!.longitude,
      });
    });
  }
}
