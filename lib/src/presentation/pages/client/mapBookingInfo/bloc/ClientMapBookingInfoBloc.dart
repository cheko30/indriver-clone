import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/ClientMapBookingInfoEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/ClientMapBookingInfoState.dart';

class ClientMapBookingInfoBloc
    extends Bloc<ClientMapBookingInfoEvent, ClientMapBookingInfoState> {
  GeolocatorUseCases geolocatorUseCases;

  ClientMapBookingInfoBloc(this.geolocatorUseCases)
      : super(ClientMapBookingInfoState()) {
    on<ClientMapBookingInfoInitEvent>((event, emit) async {
      Completer<GoogleMapController> controller =
          Completer<GoogleMapController>();
      emit(state.copyWith(
          pickUpLatLng: event.pickUpLatLng,
          destinationLatLng: event.destinationLatLng,
          pickUpDescription: event.pickUpDescription,
          destinationDescription: event.destinationDescription,
          controller: controller));
      BitmapDescriptor pickUpDescriptor =
          await geolocatorUseCases.createMarker.run('assets/img/flag.png');
      BitmapDescriptor destinationDescriptor =
          await geolocatorUseCases.createMarker.run('assets/img/flag.png');

      Marker markerPickUp = geolocatorUseCases.getMarker.run(
          'pickUp',
          state.pickUpLatLng!.latitude,
          state.pickUpLatLng!.longitude,
          'Lugar de recogida',
          'Debes permances aqui mientras llega el conductor',
          pickUpDescriptor);

      Marker markerDestination = geolocatorUseCases.getMarker.run(
          'destination',
          state.destinationLatLng!.latitude,
          state.destinationLatLng!.longitude,
          'Tú destino',
          '',
          destinationDescriptor);
      emit(state.copyWith(markers: {
        markerPickUp.markerId: markerPickUp,
        markerDestination.markerId: markerDestination
      }));
    });

    on<ChangeMapCameraPosition>((event, emit) async {
      GoogleMapController googleMapController = await state.controller!.future;
      await googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.lat, event.lng), zoom: 13, bearing: 0)));
    });

    on<AddPolyline>((event, emit) async {
      List<LatLng> polylineCoordinates = await geolocatorUseCases.getPolyline
          .run(state.pickUpLatLng!, state.destinationLatLng!);

      PolylineId id = PolylineId("MyRoute");
      Polyline polyline = Polyline(
          polylineId: id,
          color: Colors.blueAccent,
          points: polylineCoordinates,
          width: 6);
      emit(state.copyWith(polylines: {id: polyline}));
    });
  }
}
