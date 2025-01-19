import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toFormattedString() =>
      DateFormat('EEEE MMMM d, y | hh:mm a').format(this);
}
