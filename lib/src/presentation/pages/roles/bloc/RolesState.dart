import 'package:equatable/equatable.dart';
import 'package:indrive_clone_flutter/src/domain/models/Rol.dart';

class RolesState extends Equatable {
  final List<Role>? roles;
  const RolesState({this.roles});

  RolesState copyWith({List<Role>? roles}) {
    return RolesState(roles: roles);
  }

  @override
  List<Object?> get props => [roles];
}
