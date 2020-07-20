import 'package:fish_redux/fish_redux.dart';

enum NewsAction { saveNews, onFetchNews }

class NewsActionCreator {
  static Action onFetchNews() {
    return const Action(NewsAction.onFetchNews);
  }

  static Action saveNews(payload) {
    return Action(NewsAction.saveNews, payload: payload);
  }
}
