import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/dialogs/dialog_button.dart';
import 'package:flutter_template/src/ui/snackbar/snackbar.dart';
import 'package:flutter_template/src/ui/widgets/app_h_space.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';
import 'package:flutter_template/src/ui/widgets/app_text_field_password.dart';
import 'package:flutter_template/src/ui/widgets/app_v_space.dart';

class PasswordDialog extends StatelessWidget {
  final void Function(String password) onSend;

  PasswordDialog({
    super.key,
    required this.onSend,
  });

  final _password = TextEditingController();

  void handleSend(BuildContext context) {
    if (_password.text.isEmpty) {
      snackBarError(
        context,
        content: "Veuillez vérifier votre mot de passe",
      );
    } else {
      onSend(_password.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.xs),
      ),
      elevation: 1,
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        AppText.v20(
          text: 'Confirmer votre mot de passe',
          color: AppColors.black,
          fontWeight: FontWeight.w900,
          textAlign: TextAlign.center,
        ),
        AppTextFieldPassword(
          showLabel: false,
          placeholder: 'Mot de passe',
          onChange: (value) {
            _password.text = value;
          },
        ),
        const AppVSpace(),
        Row(
          children: [
            DialogButton(
              text: 'Envoyer',
              onPressed: () => handleSend(context),
            ),
            const AppHSpace(
              width: AppSizes.xs,
            ),
            DialogButton(
              text: 'Annuler',
              secondary: true,
            ),
          ],
        )
      ]),
    );
  }
}
