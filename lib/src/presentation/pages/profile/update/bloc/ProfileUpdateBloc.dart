import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:indrive_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc() : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>((event, emit) {
      emit(state.copyWith(
        name: BlocFormItem(value: event.user?.name ?? ''),
        lastname: BlocFormItem(value: event.user?.lastname ?? ''),
        phone: BlocFormItem(value: event.user?.phone ?? ''),
        formKey: formKey,
      ));
    });
    on<NameChanged>((event, emit) {
      emit(state.copyWith(
          name: BlocFormItem(
              value: event.name.value,
              error: event.name.value.isEmpty ? 'Ingrese su nombre' : null),
          formKey: formKey));
    });
    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(
          name: BlocFormItem(
              value: event.lastname.value,
              error:
                  event.lastname.value.isEmpty ? 'Ingrese su apellido' : null),
          formKey: formKey));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(
          name: BlocFormItem(
              value: event.phone.value,
              error: event.phone.value.isEmpty ? 'Ingrese su telefono' : null),
          formKey: formKey));
    });

    on<FormSubmit>((event, emit) {
      print('Name: ${state.name.value}');
      print('Lastname: ${state.lastname.value}');
      print('Phone: ${state.phone.value}');
    });
  }
}
