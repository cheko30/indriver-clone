import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:indrive_clone_flutter/src/domain/utils/Resource.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:indrive_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  RegisterBloc(this.authUseCases) : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(
          name: BlocFormItem(
              value: event.name.value,
              error: event.name.value.isEmpty ? "Ingresa el nombre" : null),
          formKey: formKey));
    });

    on<LastnameChanged>((event, emit) {
      emit(state.copyWith(
          lastname: BlocFormItem(
              value: event.lastname.value,
              error:
                  event.lastname.value.isEmpty ? "Ingresa el apellido" : null),
          formKey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlocFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? "Ingresa el email" : null),
          formKey: formKey));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(
          phone: BlocFormItem(
              value: event.phone.value,
              error: event.phone.value.isEmpty
                  ? "Ingresa el telefono"
                  : event.phone.value.length > 10
                      ? "Menos de 10 digitos"
                      : null),
          formKey: formKey));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: BlocFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? "Ingresa el password"
                  : event.password.value.length < 6
                      ? "Mas de 6 caracteres"
                      : null),
          formKey: formKey));
    });

    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(
          confirmPAssword: BlocFormItem(
              value: event.confirmPassword.value,
              error: event.confirmPassword.value.isEmpty
                  ? "Confirma el password"
                  : event.confirmPassword.value.length < 6
                      ? "Mas de 6 caracteres"
                      : event.confirmPassword.value != state.password.value
                          ? "Los passwords no coinciden"
                          : null),
          formKey: formKey));
    });

    on<FormSubmit>((event, emit) async {
      emit(state.copyWith(response: Loading(), formKey: formKey));
      Resource response = await authUseCases.register.run(state.toUser());
      emit(state.copyWith(response: response, formKey: formKey));
    });

    on<FormReset>((event, emit) {
      state.formKey!.currentState?.reset();
    });
  }
}
