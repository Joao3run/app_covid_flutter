import 'package:intl/intl.dart';

class Utils {
  static String formattedDateAndHours(String date) {
    return new DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.parse(date));
  }
}
