import 'package:indrive_clone_flutter/src/data/dataSource/local/SharePref.dart';
import 'package:indrive_clone_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:indrive_clone_flutter/src/domain/models/AuthResponse.dart';
import 'package:indrive_clone_flutter/src/domain/models/User.dart';
import 'package:indrive_clone_flutter/src/domain/repository/AuthRepository.dart';
import 'package:indrive_clone_flutter/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;
  SharePref sharePref;

  AuthRepositoryImpl(this.authService, this.sharePref);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharePref.read('user');
    if (data != null) {
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharePref.save('user', authResponse.toJson());
  }
}
