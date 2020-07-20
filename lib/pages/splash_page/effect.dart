import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import '../../router.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
    Lifecycle.initState: _onPushHomePage,
  });
}

void _onAction(Action action, Context<SplashState> ctx) {}

void _onPushHomePage(Action action, Context<SplashState> ctx) {
  Future.delayed(Duration(seconds: 1),
      () => Router.pushAndRemove(ctx.context, Router.app, null));
}
