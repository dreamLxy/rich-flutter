import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MAState> buildReducer() {
  return asReducer(
    <Object, Reducer<MAState>>{
      MAAction.saveMAList: _saveMAList,
    },
  );
}

MAState _saveMAList(MAState state, Action action) {
  final MAState newState = state.clone();
  return newState
    ..data = action.payload['data']
    ..date = action.payload['date'];
}
