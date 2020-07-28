import 'package:fish_redux/fish_redux.dart';

enum PreferredAction { changeTabsAction, toSearchPage }

class PreferredActionCreator {
  static Action changeTabsAction(payload) {
    return Action(PreferredAction.changeTabsAction, payload: payload);
  }

  static Action toSearchPage() {
    return const Action(PreferredAction.toSearchPage);
  }
}
