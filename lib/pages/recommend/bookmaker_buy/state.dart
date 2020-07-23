import 'package:fish_redux/fish_redux.dart';
import 'package:rich/utils/constant.dart';

class BookmakerBuyState implements Cloneable<BookmakerBuyState> {
  List data = [];
  int date;
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
  BookmakerBuyState clone() {
    return BookmakerBuyState()
      ..data = data
      ..date = date;
  }
}

BookmakerBuyState initState(Map<String, dynamic> args) {
  return BookmakerBuyState();
}
