import 'package:flutter/material.dart';
import 'package:flutter_template/src/app_navigator.dart';
import 'package:flutter_template/src/constants/app_data.dart';
import 'package:flutter_template/src/features/auth/services/auth_service.dart';
import 'package:flutter_template/src/providers/app_state_provider.dart';
import 'package:flutter_template/src/providers/auth_provider.dart';
import 'package:flutter_template/src/ui/snackbar/snackbar.dart';
import 'package:flutter_template/src/utils/links.dart';
import 'package:flutter_template/src/utils/timer.dart';
import '../../../theme/app_colors.dart';
import '../models/app_user_model.dart';
import '../models/profile_item.dart';

List<ProfileItem> profileItems(
  BuildContext context, {
  required AppUser user,
}) {
  final isOwner = AppData.owners.contains(user.email);

  void reset() {
    AppNavigator.login(context);
    final provider = AppAuthProvider.of(context);
    provider.logout();
    final appProvider = AppStateProvider.of(context);
    appProvider.goToHome();
  }

  Future<void> terms(String? _) async {
    final links = Links();
    await links.terms();
  }

  Future<void> logout(String? _) async {
    final authService = AuthService();
    await authService.logout();
    reset();
  }

  Future<void> deleteAccount(String? password) async {
    if (password == null) {
      return;
    }
    final authService = AuthService();
    try {
      await authService.delete(password);
      reset();
    } catch (e) {
      if (e.toString().isNotEmpty) {
        wait(() {
          snackBarError(
            context,
            content: 'Verify your password',
          );
        });
      }
    }
  }

  String getRole() {
    late String role;
    if (user.hasAccessAdmin && user.hasAccessUser) {
      role = 'Admin, Berger';
    } else if (user.hasAccessAdmin) {
      role = 'Admin';
    } else if (user.hasAccessUser) {
      role = 'Berger';
    }

    return isOwner ? 'Owner, $role' : role;
  }

  return [
    if (user.name.isNotEmpty && user.name != 'null')
      ProfileItem(
        title: user.name,
        icon: const Icon(
          Icons.person_outline,
          color: AppColors.grey,
        ),
      ),
    if (user.email.isNotEmpty)
      ProfileItem(
        title: user.email,
        icon: const Icon(
          Icons.email_outlined,
          color: AppColors.grey,
        ),
      ),
    if (user.hasAccessAdmin || user.hasAccessUser)
      ProfileItem(
        title: getRole(),
        icon: const Icon(
          Icons.admin_panel_settings_outlined,
          color: AppColors.grey,
        ),
      ),
    if (isOwner)
      ProfileItem(
        title: 'Inviter un collaborateur',
        icon: const Icon(
          Icons.email_outlined,
          color: AppColors.grey,
        ),
        context: ProfileItemContext.invite,
      ),
    ProfileItem(
        title: 'Conditions générales',
        icon: const Icon(
          Icons.rule_sharp,
          color: AppColors.grey,
        ),
        onClick: terms),
    ProfileItem(
        title: 'Se déconnecter',
        icon: Icon(Icons.logout_outlined, color: AppColors.grey),
        onClick: logout),
    ProfileItem(
        title: 'Supprimer le compte',
        icon: Icon(
          Icons.delete_forever,
          color: AppColors.error,
        ),
        context: ProfileItemContext.delete,
        onClick: deleteAccount),
  ];
}
