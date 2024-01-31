import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime); //Mon, Jun 5, 2018
  }
}