import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NewsState> buildReducer() {
  return asReducer(
    <Object, Reducer<NewsState>>{
      NewsAction.modifyIsAddMore: _modifyIsAddMore,
      NewsAction.saveNews: _saveNews
    },
  );
}

NewsState _modifyIsAddMore(NewsState state, Action action) {
  final NewsState newState = state.clone();
  return newState..isAddMore = action.payload['isAddMore'];
}

NewsState _saveNews(NewsState state, Action action) {
  final NewsState newState = state.clone();
  newState
    ..news = action.payload['news']
    ..since = action.payload['since']
    ..end = action.payload['end'];
  return newState;
}
