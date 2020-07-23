import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'package:rich/components/KeepAliveWidget/view.dart';

class WRPage extends Page<WRState, Map<String, dynamic>> {
  WRPage()
      : super(
          wrapper: keepAliveWrapper,
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<WRState>(
              adapter: null, slots: <String, Dependent<WRState>>{}),
          middleware: <Middleware<WRState>>[],
        );
}
