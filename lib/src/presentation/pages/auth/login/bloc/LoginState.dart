import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/utils/BlocFormItem.dart';

class LoginState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final BlocFormItem email;
  final BlocFormItem password;

  const LoginState(
      {this.email = const BlocFormItem(error: "Ingresa el email"),
      this.password = const BlocFormItem(error: "Ingresa el pasword"),
      this.formKey});

  @override
  List<Object?> get props => [email, password];

  LoginState copyWith({
    GlobalKey<FormState>? formKey,
    BlocFormItem? email,
    BlocFormItem? password,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        formKey: formKey);
  }
}
