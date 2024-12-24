import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class ProfileUpdateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;

  ProfileUpdateState(
      {this.name = const BlocFormItem(error: 'Ingrese su nombre'),
      this.lastname = const BlocFormItem(error: 'Ingrese su apellido'),
      this.phone = const BlocFormItem(error: 'Ingrese su teléfono'),
      this.formKey});

  ProfileUpdateState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey,
  }) {
    return ProfileUpdateState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [name, lastname, phone];
}
