class TableEventTime {
  final int hour;

  final int minute;

  TableEventTime({
    required this.hour,
    required this.minute,
  }) : assert(60 >= minute);

  Duration difference(TableEventTime other) {
    return Duration(hours: hour - other.hour, minutes: minute - other.minute);
  }

  bool isAfter(TableEventTime other) {
    return hour > other.hour || minute > other.minute;
  }
}
