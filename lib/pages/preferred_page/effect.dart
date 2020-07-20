import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PreferredState> buildEffect() {
  return combineEffects(<Object, Effect<PreferredState>>{
    PreferredAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PreferredState> ctx) {
}
