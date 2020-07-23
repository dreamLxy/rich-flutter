import 'package:fish_redux/fish_redux.dart';

import 'package:rich/utils/event.dart';
import 'package:rich/utils/common.dart';
import 'package:rich/services/api.dart';
import 'action.dart';
import 'state.dart';

Effect<WRState> buildEffect() {
  return combineEffects(<Object, Effect<WRState>>{
    Lifecycle.initState: _onFetchWRList,
    WRAction.onFetchWRList: _onFetchWRList,
  });
}

void _onFetchWRList(Action action, Context<WRState> ctx) async {
  final payload = action.payload ?? {'date': getTodayTs() - 86400000};
  try {
    var res = await fetchPreferred(payload);
    if (res['success']) {
      print(res['result']['recommend']);
      var _data = res['result']['recommend'] ?? [];
      if (_data.length > 0) {
        _data = _data
            .map((item) => {
                  'saleDate': dataFormat(item['saleDate'], format: 'MD'),
                  'code': item['code'],
                  'name': item['name'],
                  'price': item['price'],
                  'oldPrice': item['oldPrice'] ?? '-',
                  'rate': '${item['rate']}%',
                })
            .toList();
      }
      ctx.dispatch(
          WRActionCreator.saveWRList({'data': _data, 'date': payload['date']}));
    } else {
      eventBus.fire(ShowToastEvent(res['success']));
      ctx.dispatch(
          WRActionCreator.saveWRList({'data': [], 'date': payload['date']}));
    }
  } catch (e) {
    eventBus
        .fire(ShowToastEvent(ShowToastEvent.serverError + ': ${e.toString()}'));
    ctx.dispatch(
        WRActionCreator.saveWRList({'data': [], 'date': payload['date']}));
  }
}
