import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommunityState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommunityState>>{
      CommunityAction.saveArticles: _saveArticles,
      CommunityAction.modifyIsAddMore: _modifyIsAddMore,
      CommunityAction.modifyArticleApproved: _modifyArticleApproved,
    },
  );
}

CommunityState _saveArticles(CommunityState state, Action action) {
  final CommunityState newState = state.clone();
  List _data = action.payload['data'];
  int _currentPage = action.payload['currentPage'];
  int _pageSize = action.payload['pageSize'];
  if (_currentPage == 1) {
    newState.data = _data;
  } else {
    newState.data = newState.data + _data;
  }
  newState
    ..pageSize = _pageSize
    ..currentPage = _currentPage;
  return newState;
}

CommunityState _modifyIsAddMore(CommunityState state, Action action) {
  final CommunityState newState = state.clone();
  return newState..isAddMore = action.payload['isAddMore'];
}

CommunityState _modifyArticleApproved(CommunityState state, Action action) {
  final CommunityState newState = state.clone();
  var currentArticle = newState.data[action.payload['index']];
  currentArticle['approved'] =
  action.payload['approved'];
  currentArticle['approve'] = currentArticle['approve'] + 1;
  return newState;
}
