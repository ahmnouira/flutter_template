import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/utils/logger.dart';

class ItemDialog {
  final _nameController = TextEditingController();

  Future<void> _submit(
    BuildContext context,
    onChange,
  ) async {
    try {
      onChange(_nameController.text);
      Navigator.of(context).pop();
    } catch (e) {
      Logger.error(e);
    }
    // check field
  }

  Widget buildDialog(BuildContext context, Function onChange) {
    return AlertDialog(
      title: const Text('Change Device Name'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.xs),
      ),
      scrollable: true,
      content: Column(children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: 'Change name'),
        ),
        const SizedBox(
          height: AppSizes.sm,
        ),
        ElevatedButton(
          onPressed: () => _submit(context, onChange),
          child: const Text('Change'),
        ),
      ]),
    );
  }
}
