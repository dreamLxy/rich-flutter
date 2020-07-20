import 'package:fish_redux/fish_redux.dart';

class NewsState implements Cloneable<NewsState> {
  List news;

  @override
  NewsState clone() {
    return NewsState()..news = news;
  }
}

NewsState initState(Map<String, dynamic> args) {
  return NewsState();
}
