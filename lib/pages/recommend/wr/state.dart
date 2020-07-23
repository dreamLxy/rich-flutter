import 'package:fish_redux/fish_redux.dart';
import 'package:rich/utils/constant.dart';

class WRState implements Cloneable<WRState> {
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
      'dataIndex': 'oldPrice',
      'title': '买入价',
      'width': 50.0,
    },
    {
      'type': ColumnType.doubleLayer,
      'top': 'price',
      'bottom': 'saleDate',
      'title': '卖出价',
      'width': 50.0,
    },
    {
      'dataIndex': 'rate',
      'title': '盈亏',
      'width': 60.0,
      'needColor': true,
    },
  ];

  @override
  WRState clone() {
    return WRState()
      ..data = data
      ..date = date
      ..column = column;
  }
}

WRState initState(Map<String, dynamic> args) {
  return WRState();
}
