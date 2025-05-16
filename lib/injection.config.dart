// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:indrive_clone_flutter/src/data/dataSource/local/SharePref.dart'
    as _i384;
import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/AuthService.dart'
    as _i924;
import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/UserService.dart'
    as _i315;
import 'package:indrive_clone_flutter/src/di/AppModule.dart' as _i642;
import 'package:indrive_clone_flutter/src/domain/repository/AuthRepository.dart'
    as _i515;
import 'package:indrive_clone_flutter/src/domain/repository/GeolocatorRepository.dart'
    as _i873;
import 'package:indrive_clone_flutter/src/domain/repository/SocketRepository.dart'
    as _i99;
import 'package:indrive_clone_flutter/src/domain/repository/UserRepository.dart'
    as _i1020;
import 'package:indrive_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart'
    as _i985;
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GeolocatorUseCases.dart'
    as _i510;
import 'package:indrive_clone_flutter/src/domain/useCases/socket/SocketUseCases.dart'
    as _i293;
import 'package:indrive_clone_flutter/src/domain/useCases/users/UsersUseCases.dart'
    as _i559;
import 'package:injectable/injectable.dart' as _i526;
import 'package:socket_io_client/socket_io_client.dart' as _i414;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i384.SharePref>(() => appModule.sharePref);
    gh.factory<_i414.Socket>(() => appModule.socket);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i924.AuthService>(() => appModule.authService);
    gh.factory<_i315.UserService>(() => appModule.userService);
    gh.factory<_i515.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i1020.UserRepository>(() => appModule.userRepository);
    gh.factory<_i873.GeolocatorRepository>(
        () => appModule.geolocatorRepository);
    gh.factory<_i99.SocketRepository>(() => appModule.socketRepository);
    gh.factory<_i985.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i559.UsersUseCases>(() => appModule.usersUseCases);
    gh.factory<_i510.GeolocatorUseCases>(() => appModule.geolocatorUseCases);
    gh.factory<_i293.SocketUseCases>(() => appModule.socketUseCases);
    return this;
  }
}

class _$AppModule extends _i642.AppModule {}
