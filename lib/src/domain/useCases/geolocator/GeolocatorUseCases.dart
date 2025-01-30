import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/CreateMarkerUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/FindPositionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GetMarkerUseCase.dart';

class GeolocatorUseCases {
  FindPositionUseCase findPosition;
  CreateMarkerUseCase createMarker;
  GetMarkerUseCase getMarker;

  GeolocatorUseCases({
    required this.findPosition,
    required this.createMarker,
    required this.getMarker,
  });
}
