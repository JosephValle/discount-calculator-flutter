import "package:intl/intl.dart";

extension DateTimeExtensions on DateTime {
  String toFormattedString() {
    return DateFormat("EEEE MMMM d, y | hh:mm a").format(this);
  }
}
