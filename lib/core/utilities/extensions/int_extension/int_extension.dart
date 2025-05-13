import 'package:intl/intl.dart';

extension IntExtension on int {
  String getDateFormat() {
    final DateFormat formatter = DateFormat('dd MMM yyyy, hh:mm a');
    return formatter.format(DateTime.fromMillisecondsSinceEpoch(this));
  }
}
