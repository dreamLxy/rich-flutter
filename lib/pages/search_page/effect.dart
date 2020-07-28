import 'package:fish_redux/fish_redux.dart';
import 'package:rich/services/api.dart';

import 'action.dart';
import 'state.dart';

Effect<SearchState> buildEffect() {
  return combineEffects(<Object, Effect<SearchState>>{
    SearchAction.onSearch: _onSearch,
  });
}

void _onSearch(Action action, Context<SearchState> ctx) async {
  print('on search: ${action.payload}');
  try {
    var res = await search(action.payload);
    print(res);
    if (res['success']) {
      ctx.dispatch(SearchActionCreator.saveSearchRet(res['result'] ?? []));
    }
  } catch (e) {
    print(e);
  }
}
