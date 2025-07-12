import 'package:indrive_clone_flutter/src/domain/models/DriverPosition.dart';
import 'package:indrive_clone_flutter/src/domain/repository/DriversPositionRepository.dart';

class DeleteDriverPositionUseCase {
  DriversPositionRepository driversPositionRepository;

  DeleteDriverPositionUseCase(this.driversPositionRepository);

  run(int idDriver) => driversPositionRepository.delete(idDriver);
}
