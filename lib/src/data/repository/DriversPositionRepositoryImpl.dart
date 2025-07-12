import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/DriversPositionService.dart';
import 'package:indrive_clone_flutter/src/domain/models/DriverPosition.dart';
import 'package:indrive_clone_flutter/src/domain/repository/DriversPositionRepository.dart';
import 'package:indrive_clone_flutter/src/domain/utils/Resource.dart';

class DriversPositionRepositoryImpl implements DriversPositionRepository {
  DriversPositionService driversPositionService;
  DriversPositionRepositoryImpl(this.driversPositionService);
  @override
  Future<Resource<bool>> create(DriverPosition driverPosition) {
    return driversPositionService.create(driverPosition);
  }

  @override
  Future<Resource<bool>> delete(int idDriver) {
    return driversPositionService.delete(idDriver);
  }
}
