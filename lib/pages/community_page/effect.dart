import 'package:fish_redux/fish_redux.dart';
import 'package:rich/services/api.dart';
import 'package:rich/utils/event.dart';
import 'action.dart';
import 'state.dart';

Effect<CommunityState> buildEffect() {
  return combineEffects(<Object, Effect<CommunityState>>{
    Lifecycle.initState: _initState,
    CommunityAction.onFetchArticles: _onFetchArticles,
  });
}

void _initState(Action action, Context<CommunityState> ctx) async {
  ctx.dispatch(CommunityActionCreator.onFetchArticles(null));
  final articlesController = ctx.state.articlesController;
  articlesController.addListener(() {
    if ((articlesController.position.pixels >=
            articlesController.position.maxScrollExtent - 150) &&
        ctx.state.isAddMore == false) {
      ctx.dispatch(
        CommunityActionCreator.onFetchArticles({
          'currentPage': ctx.state.currentPage + 1,
          'pageSize': ctx.state.pageSize
        }),
      );
    }
  });
}

void _onFetchArticles(Action action, Context<CommunityState> ctx) async {
  await ctx
      .dispatch(CommunityActionCreator.modifyIsAddMore({'isAddMore': true}));
  var payload = action.payload ??
      {'currentPage': ctx.state.currentPage, 'pageSize': ctx.state.pageSize};
  try {
    var res = await fetchArticles(payload);
    if (res['success']) {
      ctx.dispatch(CommunityActionCreator.saveArticles({
        'data': res['result']['data'] ?? [],
        'currentPage': payload['currentPage'],
        'pageSize': payload['pageSize']
      }));
    }
  } catch (e) {
    eventBus
        .fire(ShowToastEvent(ShowToastEvent.serverError + ': ${e.toString()}'));
  } finally {
    await ctx
        .dispatch(CommunityActionCreator.modifyIsAddMore({'isAddMore': false}));
  }
}
