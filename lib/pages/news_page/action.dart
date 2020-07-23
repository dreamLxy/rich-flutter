import 'package:fish_redux/fish_redux.dart';

enum NewsAction { initListController, modifyIsAddMore, saveNews, onFetchNews }

class NewsActionCreator {
  static Action initListController() {
    return const Action(NewsAction.initListController);
  }

  static Action modifyIsAddMore(payload) {
    return Action(NewsAction.modifyIsAddMore, payload: payload);
  }

  static Action onFetchNews(payload) {
    return Action(NewsAction.onFetchNews,
        payload: payload ?? {'since': -1, 'end': -1});
  }

  static Action saveNews(payload) {
    return Action(NewsAction.saveNews, payload: payload);
  }
}
