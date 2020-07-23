import 'package:flutter/material.dart';

import 'package:rich/utils/constant.dart';

class StockList extends StatefulWidget {
  List column = [];
  List dataSource = [];
  Function onRefresh;

  StockList({
    Key key,
    @required this.column,
    @required this.dataSource,
    this.onRefresh,
  })  : assert(column is List),
        assert(column.length > 0),
        assert(dataSource is List),
        assert(onRefresh is Function),
        super(key: key);

  @override
  StockListState createState() => StockListState();
}

class StockListState extends State<StockList> {
  Widget buildDoubleLayer(dynamic top, dynamic bottom,
      {width, topColor, bottomColor}) {
    return Container(
      width: width,
      child: Column(
        children: <Widget>[
          Text(
            '$top',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: topColor ?? normalColor,
              fontSize: top.toString().length > 8 ? 14 : 15,
            ),
          ),
          Text(
            '$bottom',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: bottomColor ?? Color.fromRGBO(0, 0, 0, .45),
                fontSize: 12),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: RefreshIndicator(
                onRefresh: widget.onRefresh,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        widget.column.length,
                        (index) => Container(
                          width: widget.column[index]['width'],
                          child: Text(
                            '${widget.column[index]['title']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          var item = widget.dataSource[index];
                          var row = List.generate(widget.column.length, (i) {
                            var _column = widget.column[i];
                            String type = _column['type'];
                            String dataIndex = _column['dataIndex'];
                            double width = _column['width'];
                            bool needColor = _column['needColor'] ?? false;

                            if (type != null) {
                              if (type == ColumnType.doubleLayer) {
                                var _topText = item[_column['top']];
                                Color topColor = normalColor;
                                if (needColor) {
                                  if (_topText is double) {
                                    print(_topText);
                                    topColor = _topText > 0 ? up : down;
                                  } else if (_topText is String) {
                                    topColor = _topText.indexOf('-') == -1
                                        ? up
                                        : down;
                                  }
                                }
                                return buildDoubleLayer(
                                  _topText,
                                  item[_column['bottom']],
                                  width: width,
                                  topColor: topColor,
                                );
                              }
                            }

                            Color _color = normalColor;
                            var _text = item[dataIndex];
                            if (needColor) {
                              if (_text is double || _text is int) {
                                _color = _text > 0 ? up : down;
                              } else if (_text is String) {
                                _color = _text.indexOf('-') == -1 ? up : down;
                              }
                            }

                            return Container(
                              width: width,
                              child: Text(
                                '$_text',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: _color,
                                  fontSize:
                                      _text.toString().length > 8 ? 13 : 15,
                                ),
                              ),
                            );
                          });
                          return Container(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: row,
                            ),
                          );
                        },
                        itemCount: widget.dataSource.length,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
