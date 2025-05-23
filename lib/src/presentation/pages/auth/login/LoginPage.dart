import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indrive_clone_flutter/src/domain/models/AuthResponse.dart';
import 'package:indrive_clone_flutter/src/domain/utils/Resource.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromARGB(255, 24, 181, 254),
        body: BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final response = state.response;
        if (response is ErrorData) {
          Fluttertoast.showToast(
              msg: response.message, toastLength: Toast.LENGTH_SHORT);
        } else if (response is Success) {
          print('SUCCCESS DATA: ${response.data}');
          final authResponse = response.data as AuthResponse;
          context
              .read<LoginBloc>()
              .add(SaveUserSession(authResponse: authResponse));
          if (authResponse.user.roles!.length > 1) {
            Navigator.pushNamedAndRemoveUntil(
                context, 'roles', (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, 'client/home', (route) => false);
          }
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final response = state.response;
          if (response is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return LoginContent(state);
        },
      ),
    ));
  }
}
