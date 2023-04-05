import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSlider extends StatelessWidget {
  final double value;
  final Color color;
  final void Function(double value)? onChanged;

  const AppSlider({
    super.key,
    required this.value,
    required this.color,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              '$value',
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        Slider(
          inactiveColor: color.withOpacity(0.5),
          activeColor: color,
          value: value,
          max: 100.0,
          divisions: 100,
          label: value.toString(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
