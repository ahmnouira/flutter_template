import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/dialogs/input_dialog.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';
import '../../../theme/app_colors.dart';
import '../models/app_user_model.dart';
import '../models/profile_item.dart';
import 'profile_item.dart';

class ProfileMenu extends StatelessWidget {
  final List<ProfileItem> items;
  final bool loggedIn;
  final AppUser user;

  const ProfileMenu({
    super.key,
    required this.user,
    this.items = const [],
    this.loggedIn = false,
  });

  void handleClick(
    BuildContext context,
    ProfileItem item,
  ) {
    final isDelete = item.context == ProfileItemContext.delete;
    final isInvite = item.context == ProfileItemContext.invite;

    if (isDelete || isInvite) {
      showDialog(
        context: context,
        builder: (context) {
          return PasswordDialog(onSend: (password) {
            item.onClick!(password);
          });
        },
      );
    } else {
      item.onClick!('');
    }
  }

  List<Widget> _buildItems(BuildContext context) {
    final list = profileItems(context, user: user);

    return list
        .map((item) => ListTile(
              leading: item.icon ?? const SizedBox(width: 8),
              title: AppText(
                text: item.title,
                color: item.context == ProfileItemContext.delete
                    ? AppColors.error
                    : AppColors.grey,
              ),
              onTap: () {
                handleClick(context, item);
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildItems(context),
    );
  }
}
