import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone_flutter/injection.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(
      create: (context) =>
          RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<ClientHomeBloc>(
      create: (context) => ClientHomeBloc(locator<AuthUseCases>())),
  BlocProvider<ProfileInfoBloc>(
      create: (context) =>
          ProfileInfoBloc(locator<AuthUseCases>())..add(GetUserInfo())),
];
