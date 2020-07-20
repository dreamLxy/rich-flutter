/// 首页
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:rich/pages/preferred_page/page.dart';
import 'package:rich/pages/mine_page/page.dart';
import 'package:rich/pages/attention_page/page.dart';
import 'package:rich/pages/community_page/page.dart';
import 'package:rich/pages/news_page/page.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AppState state, Dispatch dispatch, ViewService viewService) {
  List tabBar = [
    {
      'icon': Icon(Icons.equalizer),
      'title': Text('精选'),
      'buildTabBarView': (params) => PreferredPage().buildPage(params),
    },
    {
      'icon': Icon(Icons.comment),
      'title': Text('社区'),
      'buildTabBarView': (params) => CommunityPage().buildPage(params),
    },
    {
      'icon': Icon(Icons.star),
      'title': Text('关注'),
      'buildTabBarView': (params) => AttentionPage().buildPage(params),
    },
    {
      'icon': Icon(Icons.person),
      'title': Text('我的'),
      'buildTabBarView': (params) => MinePage().buildPage(params),
    },
    {
      'icon': Icon(Icons.person),
      'title': Text('快讯'),
      'buildTabBarView': (params) => NewsPage().buildPage(params),
    }
  ];

  void switchTab(i) {
    dispatch(AppActionCreator.switchedTab(i));
  }

  return Scaffold(
    body: IndexedStack(
      children: List.generate(
          tabBar.length,
          (index) =>
              tabBar[index]['buildTabBarView']({'setTabIndex': switchTab})),
      index: state.currentTabIndex,
    ),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: List.generate(
          tabBar.length,
          (index) => BottomNavigationBarItem(
              icon: tabBar[index]['icon'], title: tabBar[index]['title'])),
      currentIndex: state.currentTabIndex,
      onTap: switchTab,
    ),
  );
}
