import 'package:fish_redux/fish_redux.dart';

enum MAAction { onFetchMAList, saveMAList }

class MAActionCreator {
  static Action onFetchMAList(payload) {
    return Action(MAAction.onFetchMAList, payload: payload);
  }

  static Action saveMAList(payload) {
    return Action(MAAction.saveMAList, payload: payload);
  }
}
