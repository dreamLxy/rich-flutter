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
      case 'YMD':
        return '$year-$month-$day';
      case 'YMDhms':
        return '$year-$month-$day $hour:$minute:$second';
      case 'MDhm':
        return '$month-$day $hour:$minute';
      case 'MD':
        return '$month-$day';
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

/// 获取今天0点的时间戳
int getTodayTs() {
  var t = new DateTime.now();
  var ts = DateTime(t.year, t.month, t.day, 0, 0, 0).millisecondsSinceEpoch;
  return ts;
}

/// target  要转换的数字
/// postion 要保留的位数
/// isCrop  true 直接裁剪 false 四舍五入
String cropNum(num target, int postion, {bool isCrop = false}) {
  String t = target.toString();
  // 如果要保留的长度小于等于0 直接返回当前字符串
  if (postion < 0) {
    return t;
  }
  if (t.contains(".")) {
    String t1 = t.split(".").last;
    if (t1.length >= postion) {
      if (isCrop) {
        // 直接裁剪
        return t.substring(0, t.length - (t1.length - postion));
      } else {
        // 四舍五入
        return target.toStringAsFixed(postion);
      }
    } else {
      // 不够位数的补相应个数的0
      String t2 = "";
      for (int i = 0; i < postion - t1.length; i++) {
        t2 += "0";
      }
      return t + t2;
    }
  } else {
    // 不含小数的部分补点和相应的0
    String t3 = postion > 0 ? "." : "";

    for (int i = 0; i < postion; i++) {
      t3 += "0";
    }
    return t + t3;
  }
}

String formatNumber(double val) {
  if (val == null) return '-';
  double absVal = val.abs();
  if (absVal > 100000000) {
    return cropNum(val / 100000000, 2) + '亿';
  } else if (absVal > 10000) {
    return cropNum(val / 10000, 2) + '万';
  }
  return val.toString();
}
