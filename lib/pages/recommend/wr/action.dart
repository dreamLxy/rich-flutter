import 'package:fish_redux/fish_redux.dart';

enum WRAction { onFetchWRList, saveWRList }

class WRActionCreator {
  static Action onFetchWRList(payload) {
    return Action(WRAction.onFetchWRList, payload: payload);
  }

  static Action saveWRList(payload) {
    return Action(WRAction.saveWRList, payload: payload);
  }
}
