import 'package:indrive_clone_flutter/src/domain/models/DriverPosition.dart';
import 'package:indrive_clone_flutter/src/domain/repository/DriversPositionRepository.dart';

class CreateDriverPositionUseCase {
  DriversPositionRepository driversPositionRepository;

  CreateDriverPositionUseCase(this.driversPositionRepository);

  run(DriverPosition driverPosition) =>
      driversPositionRepository.create(driverPosition);
}
