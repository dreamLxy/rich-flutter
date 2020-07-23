/// 以WR指标推荐购买
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

import 'package:rich/utils/common.dart';
import 'package:rich/components/StockStatcTime/view.dart';
import 'package:rich/components/StockList/view.dart';

Widget buildView(WRState state, Dispatch dispatch, ViewService viewService) {
  Future _onRefresh() async {
    return await dispatch(WRActionCreator.onFetchWRList({'date': state.date}));
  }

  void onDateSelect(int ts) {
    if (ts != null && ts != state.date) {
      dispatch(WRActionCreator.onFetchWRList({'date': ts}));
    }
  }

  return Container(
    child: Column(
      children: <Widget>[
        StockStatcTime(
          date: state.date,
          onDateSelect: onDateSelect,
        ),
        Container(
          height: 5,
          decoration: BoxDecoration(color: Colors.grey[200]),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: StockList(
              column: state.column,
              dataSource: state.data,
              onRefresh: _onRefresh,
            ),
          ),
        )
      ],
    ),
  );
}
