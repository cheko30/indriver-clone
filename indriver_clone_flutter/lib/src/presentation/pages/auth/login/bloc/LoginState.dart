import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class LoginState extends Equatable {
  final GlobalKey<FormState>? formkey;
  final BlocFormItem email;
  final BlocFormItem password;

  const LoginState(
      {this.email = const BlocFormItem(error: "Ingresa el email"),
      this.password = const BlocFormItem(error: "Ingresa el password"),
      this.formkey});

  LoginState copyWith({
    GlobalKey<FormState>? formkey,
    BlocFormItem? email,
    BlocFormItem? password,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        formkey: formkey);
  }

  @override
  List<Object?> get props => [email, password];
}
