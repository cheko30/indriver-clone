import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone_flutter/injection.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/drivers-position/DriversPositionUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/socket/SocketUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/users/UsersUseCases.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/ClientMapBookingInfoBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/home/bloc/DriverHomeBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/roles/bloc/RolesBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/roles/bloc/RolesEvent.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(
      create: (context) =>
          RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<ClientHomeBloc>(
      create: (context) => ClientHomeBloc(locator<AuthUseCases>())),
  BlocProvider<DriverHomeBloc>(
    create: (context) => DriverHomeBloc(locator<AuthUseCases>()),
  ),
  BlocProvider<RolesBloc>(
      create: (context) =>
          RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),
  BlocProvider<ProfileInfoBloc>(
      create: (context) =>
          ProfileInfoBloc(locator<AuthUseCases>())..add(GetUserInfo())),
  BlocProvider<ProfileUpdateBloc>(
      create: (context) =>
          ProfileUpdateBloc(locator<UsersUseCases>(), locator<AuthUseCases>())),
  BlocProvider<ClientMapSeekerBloc>(
      create: (context) => ClientMapSeekerBloc(
          locator<GeolocatorUseCases>(), locator<SocketUseCases>())),
  BlocProvider<ClientMapBookingInfoBloc>(
      create: (context) =>
          ClientMapBookingInfoBloc(locator<GeolocatorUseCases>())),
  BlocProvider<DriverMapLocationBloc>(
      create: (context) => DriverMapLocationBloc(
          locator<GeolocatorUseCases>(),
          locator<SocketUseCases>(),
          locator<AuthUseCases>(),
          locator<DriversPositionUseCases>())),
];
