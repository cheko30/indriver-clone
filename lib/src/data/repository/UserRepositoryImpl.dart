import 'dart:io';

import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/UserService.dart';
import 'package:indrive_clone_flutter/src/domain/models/user.dart';
import 'package:indrive_clone_flutter/src/domain/repository/UserRepository.dart';
import 'package:indrive_clone_flutter/src/domain/utils/Resource.dart';

class UserRepositoryImpl implements UserRepository {
  UserService userService;

  UserRepositoryImpl(this.userService);

  @override
  Future<Resource<User>> update(int id, User user, File? file) {
    if (file != null) {
      return userService.updateImage(id, user, file);
    }

    return userService.update(id, user);
  }
}
