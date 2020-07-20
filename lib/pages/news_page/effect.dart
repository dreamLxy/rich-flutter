import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

import 'package:rich/services/api.dart';

Effect<NewsState> buildEffect() {
  return combineEffects(<Object, Effect<NewsState>>{
    Lifecycle.initState: _onFetchNews,
    NewsAction.onFetchNews: _onFetchNews
  });
}

void _onFetchNews(Action action, Context<NewsState> ctx) async {
  try {
    var res = await fetchNews({ 'size': 50 });
    if (res['success']) {
      ctx.dispatch(NewsActionCreator.saveNews(res['result']['message']));
    }
  } catch (e) {
    print(e);
  }
}
