import 'package:indrive_clone_flutter/src/domain/useCases/drivers-position/CreateDriverPositionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/drivers-position/DeleteDriverPositionUseCase.dart';

class DriversPositionUseCases {
  CreateDriverPositionUseCase createDriverPosition;
  DeleteDriverPositionUseCase deleteDriverPosition;

  DriversPositionUseCases({
    required this.createDriverPosition,
    required this.deleteDriverPosition,
  });
}
