import 'package:fish_redux/fish_redux.dart';

class PreferredState implements Cloneable<PreferredState> {

  @override
  PreferredState clone() {
    return PreferredState();
  }
}

PreferredState initState(Map<String, dynamic> args) {
  return PreferredState();
}
