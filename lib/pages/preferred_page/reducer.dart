import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PreferredState> buildReducer() {
  return asReducer(
    <Object, Reducer<PreferredState>>{
      PreferredAction.action: _onAction,
    },
  );
}

PreferredState _onAction(PreferredState state, Action action) {
  final PreferredState newState = state.clone();
  return newState;
}
