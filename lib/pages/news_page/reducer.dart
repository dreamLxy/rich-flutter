import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NewsState> buildReducer() {
  return asReducer(
    <Object, Reducer<NewsState>>{
      NewsAction.saveNews: _saveNews
    },
  );
}

NewsState _saveNews(NewsState state, Action action) {
  final NewsState newState = state.clone();
  return newState..news = action.payload;
}
