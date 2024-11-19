import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone_flutter/injection.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc()..add(RegisterInitEvent())),
];
