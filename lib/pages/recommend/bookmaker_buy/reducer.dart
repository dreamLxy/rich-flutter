import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BookmakerBuyState> buildReducer() {
  return asReducer(
    <Object, Reducer<BookmakerBuyState>>{
      BookmakerBuyAction.saveInflowList: _saveInflowList,
    },
  );
}

BookmakerBuyState _saveInflowList(BookmakerBuyState state, Action action) {
  final BookmakerBuyState newState = state.clone();
  return newState
    ..data = action.payload['data']
    ..date = action.payload['date'];
}
