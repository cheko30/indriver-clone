import 'package:indrive_clone_flutter/src/domain/models/DriverPosition.dart';
import 'package:indrive_clone_flutter/src/domain/utils/Resource.dart';

abstract class DriversPositionRepository {
  Future<Resource<bool>> create(DriverPosition driverPosition);
  Future<Resource<bool>> delete(int idDriver);
}
