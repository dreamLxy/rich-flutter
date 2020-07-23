import 'package:fish_redux/fish_redux.dart';

enum BookmakerBuyAction { onFetchInflowList, saveInflowList }

class BookmakerBuyActionCreator {
  static Action onFetchInflowList(payload) {
    return Action(BookmakerBuyAction.onFetchInflowList, payload: payload);
  }
  static Action saveInflowList(payload) {
    return Action(BookmakerBuyAction.saveInflowList, payload: payload);
  }
}
