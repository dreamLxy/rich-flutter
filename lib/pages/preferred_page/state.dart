import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:rich/pages/recommend/ma/page.dart';
import 'package:rich/pages/recommend/bookmaker_buy/page.dart';
import 'package:rich/pages/recommend/wr/page.dart';

class PreferredState implements Cloneable<PreferredState> {
  List tabs = [
    { 'title': '今日精选', 'component': (params) => WRPage().buildPage(params) },
    { 'title': '主力流入', 'component': (params) => BookmakerBuyPage().buildPage(params), },
    { 'title': '近期关注', 'component': (params) => MAPage().buildPage(params) },
  ];

  TabController tabController;

  @override
  PreferredState clone() {
    return PreferredState()
      ..tabs = tabs
      ..tabController = tabController;
  }
}

PreferredState initState(Map<String, dynamic> args) {
  return PreferredState();
}
