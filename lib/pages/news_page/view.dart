/// 快讯
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:rich/utils/common.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(NewsState state, Dispatch dispatch, ViewService viewService) {
  Future _onRefresh() async {}

  return Scaffold(
    appBar: AppBar(
      title: Text('快讯'),
    ),
    body: Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      var item = state.news[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              dataFormat(item['created_at'], format: 'MDhm'),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            child: Text(item['text'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )
                        ],
                      );
                    },
                    itemCount: state.news.length),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
