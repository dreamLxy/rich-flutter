import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchState>>{
      SearchAction.saveSearchRet: _saveSearchRet,
    },
  );
}

SearchState _saveSearchRet(SearchState state, Action action) {
  final SearchState newState = state.clone();
  return newState..searchRet = action.payload;
}
