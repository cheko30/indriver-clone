import 'package:indrive_clone_flutter/src/data/api/ApiConfig.dart';
import 'package:indrive_clone_flutter/src/data/dataSource/local/SharePref.dart';
import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/DriversPositionService.dart';
import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/UserService.dart';
import 'package:indrive_clone_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:indrive_clone_flutter/src/data/repository/DriversPositionRepositoryImpl.dart';
import 'package:indrive_clone_flutter/src/data/repository/GeolocatorRepositoryImpl.dart';
import 'package:indrive_clone_flutter/src/data/repository/SocketRepositoryImpl.dart';
import 'package:indrive_clone_flutter/src/data/repository/UserRepositoryImpl.dart';
import 'package:indrive_clone_flutter/src/domain/models/AuthResponse.dart';
import 'package:indrive_clone_flutter/src/domain/repository/AuthRepository.dart';
import 'package:indrive_clone_flutter/src/domain/repository/DriversPositionRepository.dart';
import 'package:indrive_clone_flutter/src/domain/repository/GeolocatorRepository.dart';
import 'package:indrive_clone_flutter/src/domain/repository/SocketRepository.dart';
import 'package:indrive_clone_flutter/src/domain/repository/UserRepository.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/drivers-position/CreateDriverPositionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/drivers-position/DeleteDriverPositionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/drivers-position/DriversPositionUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/CreateMarkerUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/FindPositionUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GetMarkerUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GetPlacemarkDataUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GetPolylineUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GetPositionStreamUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/socket/ConnectSocketUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/socket/DisconnectSocketUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/socket/SocketUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';

@module
abstract class AppModule {
  @injectable
  SharePref get sharePref => SharePref();

  @injectable
  Socket get socket => io(
      'http://${ApiConfig.API_URL}',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build());

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
  DriversPositionService get driversPositionService => DriversPositionService();

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharePref);

  @injectable
  UserRepository get userRepository => UserRepositoryImpl(userService);

  @injectable
  GeolocatorRepository get geolocatorRepository => GeolocatorRepositoryImpl();

  @injectable
  SocketRepository get socketRepository => SocketrepositoryImpl(socket);

  @injectable
  DriversPositionRepository get driversPositionRepository =>
      DriversPositionRepositoryImpl(driversPositionService);

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
        findPosition: FindPositionUseCase(geolocatorRepository),
        createMarker: CreateMarkerUseCase(geolocatorRepository),
        getMarker: GetMarkerUseCase(geolocatorRepository),
        getPlacemarkData: GetPlacemarkDataUseCase(geolocatorRepository),
        getPolyline: GetPolylineUseCase(geolocatorRepository),
        getPositionStream: GetPositionStreamUseCase(geolocatorRepository),
      );

  @injectable
  SocketUseCases get socketUseCases => SocketUseCases(
        connect: ConnectSocketUsecase(socketRepository),
        disconnect: DisconnectSocketUsecase(socketRepository),
      );

  @injectable
  DriversPositionUseCases get driversPositionUseCases =>
      DriversPositionUseCases(
          createDriverPosition:
              CreateDriverPositionUseCase(driversPositionRepository),
          deleteDriverPosition:
              DeleteDriverPositionUseCase(driversPositionRepository));
}
