import 'package:indrive_clone_flutter/src/presentation/utils/BlocFormItem.dart';

abstract class Loginevent {}

class LoginInitEvent extends Loginevent {}

class EmailChanged extends Loginevent {
  final BlocFormItem email;
  EmailChanged({required this.email});
}

class PasswordChanged extends Loginevent {
  final BlocFormItem password;
  PasswordChanged({required this.password});
}

class FormSubmit extends Loginevent {}
