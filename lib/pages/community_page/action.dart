import 'package:fish_redux/fish_redux.dart';

enum CommunityAction {
  onFetchArticles,
  saveArticles,
  modifyIsAddMore,
  onArticleApprove,
  modifyArticleApproved
}

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

  static Action onArticleApprove(payload) {
    return Action(CommunityAction.onArticleApprove, payload: payload);
  }

  static Action modifyArticleApproved(payload) {
    return Action(CommunityAction.modifyArticleApproved, payload: payload);
  }
}