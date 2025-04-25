import 'package:flutter_template/src/utils/logger.dart';

import '../../profile/models/app_user_model.dart';

class UserService {
  /// Saving [AppUser]
  Future<void> add(AppUser user) async {
    Logger.map(user.toMap());
  }

  /// Getting [AppUser]
  Future<AppUser> get(String uid) async {
    return AppUser.empty();
  }

  /// Deleting [AppUser]
  Future<void> delete(String id) async {
    throw UnimplementedError();
  }
}
