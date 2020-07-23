import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WRState> buildReducer() {
  return asReducer(
    <Object, Reducer<WRState>>{
      WRAction.saveWRList: _saveWRList,
    },
  );
}

WRState _saveWRList(WRState state, Action action) {
  final WRState newState = state.clone();
  return newState
    ..data = action.payload['data']
    ..date = action.payload['date'];
}
