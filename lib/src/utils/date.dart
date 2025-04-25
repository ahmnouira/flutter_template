import 'package:intl/intl.dart';

class Date {
  String format(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
    // '${date.day}/${date.month}/${date.year}';
  }

  DateTime parse(String date) {
    if (DateFormat('dd/MM/yyyy').tryParse(date) != null) {
      return DateFormat('dd/MM/yyyy').parse(date);
    }

    return DateTime.now();
  }
}
