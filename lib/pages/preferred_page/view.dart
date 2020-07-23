/// 精选
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:rich/components/TopTabBar/view.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PreferredState state, Dispatch dispatch, ViewService viewService) {
  TextEditingController _searchController = TextEditingController();
  Color searchColor = Colors.grey[100];

  void _onSearch() {}

  Widget search = Container(
    color: Colors.blue[400],
//        height: 24,
    width: 245,
    padding: const EdgeInsets.all(4),
    child: Row(
      children: <Widget>[
        Container(
          child: Icon(
            Icons.search,
            size: 18,
            color: searchColor,
          ),
          margin: const EdgeInsets.only(right: 6),
        ),
        Text(
          '搜索股票名称/首字母/编号',
          style: TextStyle(fontSize: 12, color: searchColor),
        ),
      ],
    ),
  );

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
          onPressed: _onSearch,
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
