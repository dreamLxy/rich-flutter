import 'package:fish_redux/fish_redux.dart';

enum PreferredAction { changeTabsAction }

class PreferredActionCreator {
  static Action changeTabsAction(payload) {
    return Action(PreferredAction.changeTabsAction, payload: payload);
  }
}
