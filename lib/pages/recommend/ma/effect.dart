import 'package:fish_redux/fish_redux.dart';
import 'package:rich/utils/common.dart';
import 'package:rich/utils/event.dart';

import 'action.dart';
import 'state.dart';
import 'package:rich/services/api.dart';

Effect<MAState> buildEffect() {
  return combineEffects(<Object, Effect<MAState>>{
    Lifecycle.initState: _onFetchMAList,
    MAAction.onFetchMAList: _onFetchMAList,
  });
}

void _onFetchMAList(Action action, Context<MAState> ctx) async {
  final payload = action.payload ?? {'date': getTodayTs() - 86400000};
  try {
    var res = await fetchMAList(payload);
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
      ctx.dispatch(
          MAActionCreator.saveMAList({'data': _data, 'date': payload['date']}));
    } else {
      ctx.dispatch(
          MAActionCreator.saveMAList({'data': [], 'date': payload['date']}));
    }
  } catch (e) {
    eventBus
        .fire(ShowToastEvent(ShowToastEvent.serverError + ': ${e.toString()}'));
    ctx.dispatch(
        MAActionCreator.saveMAList({'data': [], 'date': payload['date']}));
  }
}
