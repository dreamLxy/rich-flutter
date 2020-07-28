/// 精选
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:rich/components/TopTabBar/view.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PreferredState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: PreferredSize(
        child: TopTabBar(
          tabList: state.tabs,
          controller: state.tabController,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => dispatch(PreferredActionCreator.toSearchPage()),
        )
      ],
    ),
    body: TabBarView(
      controller: state.tabController,
      children: List.generate(
        state.tabs.length,
        (index) => state.tabs[index]['component'](null),
      ),
    ),
  );
}
