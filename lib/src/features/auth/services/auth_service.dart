import 'package:flutter_template/src/features/profile/models/app_user_model.dart';

class AuthService {
  bool get isLoggedIn => true;

  AppUser get user => AppUser.mock();

  String handleError(Object error) {
    return error.toString();
  }

  Future<void> logout() {
    return Future.value();
  }

  Future<List<String>> delete(String password) {
    return Future.value([password]);
  }

  Future<AppUser?> login(String email, String password) async {
    Future.value([email, password]);

    return AppUser.empty();
  }

  Future<AppUser?> register(String email, String password) async {
    Future.value([email, password]);

    return AppUser.empty();
  }
}
