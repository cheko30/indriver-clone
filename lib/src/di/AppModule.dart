import 'package:indrive_clone_flutter/src/data/dataSource/local/SharePref.dart';
import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:indrive_clone_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:indrive_clone_flutter/src/domain/repository/AuthRepository.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  SharePref get sharePref => SharePref();

  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharePref);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        saveUserSession: SaveUserSessionUseCase(authRepository),
        getUserSession: GetUserSessionUseCase(authRepository),
      );
}
