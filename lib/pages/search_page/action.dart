import 'package:fish_redux/fish_redux.dart';

enum SearchAction { onSearch, saveSearchRet }

class SearchActionCreator {
  static Action onSearch(payload) {
    return Action(SearchAction.onSearch, payload: payload);
  }

  static Action saveSearchRet(payload) {
    return Action(SearchAction.saveSearchRet, payload: payload);
  }
}
