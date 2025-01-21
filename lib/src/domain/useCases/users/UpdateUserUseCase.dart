import 'dart:io';

import 'package:indrive_clone_flutter/src/domain/models/user.dart';
import 'package:indrive_clone_flutter/src/domain/repository/UserRepository.dart';

class UpdateUserUsecase {
  UserRepository userRepository;
  UpdateUserUsecase(this.userRepository);

  run(int id, User user, File? file) => userRepository.update(id, user, file);
}
