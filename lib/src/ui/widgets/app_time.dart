import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTime extends StatelessWidget {
  final TimeOfDay selected;

  final void Function(TimeOfDay selected) onSelect;

  const AppTime({super.key, required this.onSelect, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time of Day',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              onPressed: () async {
                final selectedDate = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (selectedDate != null) {
                  onSelect(selectedDate);
                }
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Text(selected.format(context)),
      ],
    );
  }
}
