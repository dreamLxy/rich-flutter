import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AttentionState> buildEffect() {
  return combineEffects(<Object, Effect<AttentionState>>{
    AttentionAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AttentionState> ctx) {
}
