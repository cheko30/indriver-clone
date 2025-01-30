import 'package:indrive_clone_flutter/src/data/dataSource/local/SharePref.dart';
import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/UserService.dart';
import 'package:indrive_clone_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:indrive_clone_flutter/src/data/repository/GeolocatorRepositoryImpl.dart';
import 'package:indrive_clone_flutter/src/data/repository/UserRepositoryImpl.dart';
import 'package:indrive_clone_flutter/src/domain/models/AuthResponse.dart';
import 'package:indrive_clone_flutter/src/domain/repository/AuthRepository.dart';
import 'package:indrive_clone_flutter/src/domain/repository/GeolocatorRepository.dart';
import 'package:indrive_clone_flutter/src/domain/repository/UserRepository.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/FindPositionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  SharePref get sharePref => SharePref();

  @injectable
  Future<String> get token async {
    String token = '';
    final userSession = await sharePref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }

    return token;
  }

  @injectable
  AuthService get authService => AuthService();

  @injectable
  UserService get userService => UserService(token);

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharePref);

  @injectable
  UserRepository get userRepository => UserRepositoryImpl(userService);

  @injectable
  GeolocatorRepository get geolocatorRepository => GeolocatorRepositoryImpl();

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        saveUserSession: SaveUserSessionUseCase(authRepository),
        getUserSession: GetUserSessionUseCase(authRepository),
        logout: LogoutUseCase(authRepository),
      );

  @injectable
  UsersUseCases get usersUseCases =>
      UsersUseCases(update: UpdateUserUsecase(userRepository));

  @injectable
  GeolocatorUseCases get geolocatorUseCases => GeolocatorUseCases(
      findPosition: FindPositionUseCase(geolocatorRepository));
}
