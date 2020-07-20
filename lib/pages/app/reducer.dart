import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AppState> buildReducer() {
  return asReducer(
    <Object, Reducer<AppState>>{
      AppAction.switchedTab: _switchedTab,
    },
  );
}

AppState _switchedTab(AppState state, Action action) {
  final AppState newState = state.clone();
  return newState..currentTabIndex = action.payload;
}