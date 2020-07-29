import 'package:fish_redux/fish_redux.dart';
import 'package:rich/router.dart';
import 'action.dart';
import 'state.dart';

Effect<ImageViewState> buildEffect() {
  return combineEffects(<Object, Effect<ImageViewState>>{
    ImageViewAction.onGoBack: _onGoBack,
  });
}

void _onGoBack(Action action, Context<ImageViewState> ctx) {
  Router.pop(ctx.context);
}
