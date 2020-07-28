import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchState state, Dispatch dispatch, ViewService viewService) {

  Widget _search = Container(
    height: 34,
    child: TextField(
      textAlign: TextAlign.left,
      maxLines: 1,
      style: TextStyle(fontSize: 16, textBaseline: TextBaseline.ideographic),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 11),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4)),
        filled: true,
        fillColor: Colors.white,
        hintText: '股票代码/名称/简拼',
        hintStyle: TextStyle(fontSize: 12),
      ),
      onSubmitted: (text) {
        if (text != null) {
          dispatch(SearchActionCreator.onSearch({'content': text}));
        }
        return text;
      },
    ),
  );

  return Scaffold(
    appBar: AppBar(
      title: _search,
    ),
    body: Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: List.generate(state.searchRet.length, (index) {
              var item = state.searchRet[index] ?? {};
              return Container(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 6, bottom: 6),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey[200]))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item['name'],
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          item['code'],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Text(item['current'].toString()),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    ),
  );
}
