import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

import 'package:rich/services/api.dart';

Effect<NewsState> buildEffect() {
  return combineEffects(<Object, Effect<NewsState>>{
    Lifecycle.initState: _initState,
    NewsAction.onFetchNews: _onFetchNews
  });
}

Future _initState(Action action, Context<NewsState> ctx) async {
  await ctx.dispatch(NewsActionCreator.onFetchNews(null));

  final newsListController = ctx.state.newsListController;
  newsListController.addListener(() async {
    if ((newsListController.position.pixels >=
            newsListController.position.maxScrollExtent - 150) &&
        ctx.state.isAddMore == false) {
      await ctx
          .dispatch(NewsActionCreator.modifyIsAddMore({'isAddMore': true}));
      await ctx.dispatch(NewsActionCreator.onFetchNews({
        'since': ctx.state.since,
        'end': ctx.state.end,
      }));
    }
  });
}

Future _onFetchNews(Action action, Context<NewsState> ctx) async {
  final payload = action.payload;
  try {
    var res = await fetchNews(payload);
    if (res['success']) {
      final resNews = res['result']['items'];
      final news = payload['since'] == -1 ? resNews : ctx.state.news + resNews;
      ctx.dispatch(NewsActionCreator.saveNews({
        'news': news,
        'since': res['result']['next_id'],
        'end': res['result']['next_max_id'],
      }));
    }
  } catch (e) {
    print(e);
  } finally {
    await ctx.dispatch(NewsActionCreator.modifyIsAddMore({'isAddMore': false}));
  }
}
