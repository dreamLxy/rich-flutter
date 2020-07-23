import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class NewsState implements Cloneable<NewsState> {
  List news = [];
  int since = -1;
  int end = -1;

  ScrollController newsListController = new ScrollController();
  bool isAddMore = false;

  @override
  NewsState clone() {
    return NewsState()
      ..newsListController = newsListController
      ..isAddMore = isAddMore
      ..news = news
      ..since = since
      ..end = end;
  }
}

NewsState initState(Map<String, dynamic> args) {
  return NewsState();
}
