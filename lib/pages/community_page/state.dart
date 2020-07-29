import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class CommunityState implements Cloneable<CommunityState> {
  List data = [];
  int currentPage = 1;
  int pageSize = 20;
  ScrollController articlesController = new ScrollController();
  bool isAddMore = false;

  @override
  CommunityState clone() {
    return CommunityState()
      ..articlesController = articlesController
      ..isAddMore = isAddMore
      ..data = data
      ..currentPage = currentPage
      ..pageSize = pageSize;
  }
}

CommunityState initState(Map<String, dynamic> args) {
  return CommunityState();
}
