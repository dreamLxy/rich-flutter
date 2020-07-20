/// 时间戳转换
String dataFormat(int timestamp, {String format}) {
  if (timestamp is int && timestamp > 0) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp);
    int year = time.year;
    String month = time.month < 10 ? '0${time.month}' : '${time.month}';
    String day = time.day < 10 ? '0${time.day}' : '${time.day}';
    String hour = time.hour < 10 ? '0${time.hour}' : '${time.hour}';
    String minute = time.minute < 10 ? '0${time.minute}' : '${time.minute}';
    String second = time.second < 10 ? '0${time.second}' : '${time.second}';

    switch (format) {
      case 'YMDhms':
        return '$year-$month-$day $hour:$minute:$second';
      case 'MDhm':
        return '$month-$day $hour:$minute';
      default:
        return '$time';
    }
  }
  return '-';
}

/// 2020-07-11T08:14:08.870Z 转换
DateTime dateFormatUtc(String timeString, {String format}) {
  DateTime time = DateTime.parse(timeString).toLocal();
  return time;
}
