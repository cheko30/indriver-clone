import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ClientMapSeekerEvent {}

class ClientMapSeekerInitEvent extends ClientMapSeekerEvent {}

class FindPosition extends ClientMapSeekerEvent {}

class ChangeMapCameraPosition extends ClientMapSeekerEvent {
  final double lat;
  final double lng;

  ChangeMapCameraPosition({required this.lat, required this.lng});
}

class OnCameraMove extends ClientMapSeekerEvent {
  CameraPosition cameraPosition;
  OnCameraMove({required this.cameraPosition});
}

class OnCamaraIdle extends ClientMapSeekerEvent {}

class OnAutoCompletedPickUpSelected extends ClientMapSeekerEvent {
  double lat;
  double lng;
  String pickUpDescription;
  OnAutoCompletedPickUpSelected(
      {required this.lat, required this.lng, required this.pickUpDescription});
}

class OnAutoCompletedDestinationSelected extends ClientMapSeekerEvent {
  double lat;
  double lng;
  String destinationDescription;
  OnAutoCompletedDestinationSelected(
      {required this.lat,
      required this.lng,
      required this.destinationDescription});
}

class ConnectSocketIO extends ClientMapSeekerEvent {}

class DisconnectSocketIO extends ClientMapSeekerEvent {}

class ListenDriversPositionSocketIO extends ClientMapSeekerEvent {}

class ListenDriversDisconnectSocketIO extends ClientMapSeekerEvent {}

class AddDriverPositionMarker extends ClientMapSeekerEvent {
  final String idSocket;
  final int id;
  final double lat;
  final double lng;

  AddDriverPositionMarker({
    required this.idSocket,
    required this.id,
    required this.lat,
    required this.lng,
  });
}

class RemoveDriverPositionMarker extends ClientMapSeekerEvent {
  final String idSocket;
  RemoveDriverPositionMarker({required this.idSocket});
}
