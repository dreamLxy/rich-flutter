import 'package:fish_redux/fish_redux.dart';

class AppState implements Cloneable<AppState> {
  int currentTabIndex = 0; // tab页下标

  @override
  AppState clone() {
    return AppState()
      ..currentTabIndex = currentTabIndex;
  }
}

AppState initState(Map<String, dynamic> args) {
  return AppState();
}
