import 'package:flutter/material.dart';
import 'package:rich/utils/constant.dart';

class TopTabBar extends StatefulWidget {
  final List tabList;
  final TabController controller;
  final Function onTab;

  TopTabBar(
      {Key key, @required this.tabList, @required this.controller, this.onTab})
      : super(key: key);

  @override
  _TopTabBarState createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: up,
      isScrollable: true,
      //是否可以滚动
      controller: widget.controller,
      tabs: List.generate(
          widget.tabList.length,
          (index) => Tab(
                text: widget.tabList[index]['title'],
              )),
      onTap: (index) {
        if (widget.onTab != null) {
          widget.onTab(index);
        }
      },
    );
  }
}
