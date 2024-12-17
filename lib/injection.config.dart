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
import 'package:indrive_clone_flutter/src/di/AppModule.dart' as _i642;
import 'package:indrive_clone_flutter/src/domain/repository/AuthRepository.dart'
    as _i515;
import 'package:indrive_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart'
    as _i985;
import 'package:injectable/injectable.dart' as _i526;

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
    gh.factory<_i924.AuthService>(() => appModule.authService);
    gh.factory<_i515.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i985.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i642.AppModule {}
