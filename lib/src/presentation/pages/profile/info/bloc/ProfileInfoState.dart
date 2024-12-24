import 'package:equatable/equatable.dart';
import 'package:indrive_clone_flutter/src/domain/models/user.dart';

class ProfileInfoState extends Equatable {
  User? user;
  ProfileInfoState({this.user});

  ProfileInfoState copyWith({User? user}) {
    return ProfileInfoState(user: user);
  }

  @override
  List<Object?> get props => [user];
}
