import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'package:rich/components/KeepAliveWidget/view.dart';

class MAPage extends Page<MAState, Map<String, dynamic>> {
  MAPage()
      : super(
          wrapper: keepAliveWrapper,
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MAState>(
              adapter: null, slots: <String, Dependent<MAState>>{}),
          middleware: <Middleware<MAState>>[],
        );
}
