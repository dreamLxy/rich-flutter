import 'package:fish_redux/fish_redux.dart';
import 'package:rich/utils/constant.dart';

class MAState implements Cloneable<MAState> {
  List data = [];
  int date; // 请求的时间戳
  List column = [
    {
      'type': ColumnType.doubleLayer,
      'top': 'name',
      'bottom': 'code',
      'title': '股票',
      'width': 80.0,
    },
    {
      'dataIndex': 'value',
      'title': '市值',
      'width': 80.0,
    },
    {
      'dataIndex': 'inflow',
      'title': '净流入',
      'needColor': true,
      'width': 80.0,
    },
    {
      'type': ColumnType.doubleLayer,
      'top': 'rate',
      'bottom': 'price',
      'title': '涨幅/现价',
      'width': 80.0,
      'needColor': true
    },
  ];

  @override
  MAState clone() {
    return MAState()
      ..data = data
      ..date = date;
  }
}

MAState initState(Map<String, dynamic> args) {
  return MAState();
}
