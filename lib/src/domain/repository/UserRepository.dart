import 'dart:io';

import 'package:indrive_clone_flutter/src/domain/models/user.dart';
import 'package:indrive_clone_flutter/src/domain/utils/Resource.dart';

abstract class UserRepository {
  Future<Resource<User>> update(int id, User user, File? file);
}
