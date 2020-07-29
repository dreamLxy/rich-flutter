import 'package:fish_redux/fish_redux.dart';

enum CommunityAction { onFetchArticles, saveArticles, modifyIsAddMore }

class CommunityActionCreator {
  static Action onFetchArticles(payload) {
    return Action(CommunityAction.onFetchArticles, payload: payload);
  }
  static Action saveArticles(payload) {
    return Action(CommunityAction.saveArticles, payload: payload);
  }
  static Action modifyIsAddMore(payload) {
    return Action(CommunityAction.modifyIsAddMore, payload: payload);
  }
}
