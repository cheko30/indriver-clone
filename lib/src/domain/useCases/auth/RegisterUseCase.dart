import 'package:indrive_clone_flutter/src/domain/models/User.dart';
import 'package:indrive_clone_flutter/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  run(User user) => authRepository.register(user);
}
