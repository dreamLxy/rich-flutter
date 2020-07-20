import 'package:fish_redux/fish_redux.dart';

class AttentionState implements Cloneable<AttentionState> {

  @override
  AttentionState clone() {
    return AttentionState();
  }
}

AttentionState initState(Map<String, dynamic> args) {
  return AttentionState();
}
