import 'package:fish_redux/fish_redux.dart';

import 'package:rich/utils/common.dart';
import 'package:rich/services/api.dart';
import 'package:rich/utils/event.dart';
import 'action.dart';
import 'state.dart';

Effect<BookmakerBuyState> buildEffect() {
  /// 主力净流入列表
  return combineEffects(<Object, Effect<BookmakerBuyState>>{
    Lifecycle.initState: _onFetchInflowList,
    BookmakerBuyAction.onFetchInflowList: _onFetchInflowList,
  });
}

void _onFetchInflowList(Action action, Context<BookmakerBuyState> ctx) async {
  final payload = action.payload ?? {'date': getTodayTs() - 86400000};
  try {
    var res = await fetchInflowList(payload);
    print(res);
    if (res['success']) {
      var _data = res['result']['recommend'] ?? [];
      if (_data.length > 0) {
        _data = _data
            .map((item) => {
          'code': item['code'],
          'name': item['name'],
          'value': formatNumber(item['value']),
          'inflow': formatNumber(item['inflow']),
          'price': item['price'],
          'rate': '${item['rate']}%',
        })
            .toList();
      }
      ctx.dispatch(BookmakerBuyActionCreator.saveInflowList(
          {'data': _data, 'date': payload['date']}));
    } else {
      ctx.dispatch(BookmakerBuyActionCreator.saveInflowList(
          {'data': [], 'date': payload['date']}));
    }
  } catch (e) {
    eventBus.fire(ShowToastEvent(ShowToastEvent.serverError + ': ${e.toString()}'));
    ctx.dispatch(BookmakerBuyActionCreator.saveInflowList(
        {'data': [], 'date': payload['date']}));
  }
}
