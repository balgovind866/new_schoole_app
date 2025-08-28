import 'package:intl/intl.dart';

class DateTimeUtils {
  /// Converts "2024-06-23" to "Sunday 23 June"
  static String formatGameDate(String? dateStr) {
    try {
      if (dateStr == null) return '';
      final date = DateTime.parse(dateStr);
      return DateFormat('EEEE dd MMMM').format(date); // Sunday 23 June
    } catch (e) {
      return '';
    }
  }

  /// Converts "15:00" to "15:00" or "03:00 PM"
  static String formatGameTime(String? timeStr, {bool use12Hour = false}) {
    try {
      if (timeStr == null) return '';
      final now = DateTime.now();
      final parts = timeStr.split(":");
      final dateTime = DateTime(now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));
      return DateFormat(use12Hour ? 'hh:mm a' : 'HH:mm').format(dateTime);
    } catch (e) {
      return '';
    }
  }
}
