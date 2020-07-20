import 'package:fish_redux/fish_redux.dart';

enum AppAction { switchedTab }

class AppActionCreator {
  static Action switchedTab(int i) {
    return Action(AppAction.switchedTab, payload: i);
  }
}
