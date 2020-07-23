import 'package:flutter/material.dart';
import 'package:rich/utils/common.dart';

class StockStatcTime extends StatefulWidget {
  final int date; /// 当前时间
  final Function onDateSelect; /// 选择时间

  StockStatcTime({Key key, @required this.date, @required this.onDateSelect}) : super(key: key);

  @override
  StockStatcTimeState createState() => StockStatcTimeState();
}

class StockStatcTimeState extends State<StockStatcTime> {

  /// 选择时间
  Future _onDateTap() async {
    var ts = await showDatePicker(context: context,
        initialDate: DateTime.fromMillisecondsSinceEpoch(widget.date),
        firstDate: DateTime(2020),
        lastDate: DateTime.now());
    if (ts != null) {
      widget.onDateSelect(ts?.millisecondsSinceEpoch);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: _onDateTap,
            child: Row(
              children: <Widget>[
                Text('时间: ${dataFormat(widget.date, format: 'YMD')}'),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          )
        ],
      ),
    );
  }
}
