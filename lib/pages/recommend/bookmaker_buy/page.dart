import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'package:rich/components/KeepAliveWidget/view.dart';

class BookmakerBuyPage extends Page<BookmakerBuyState, Map<String, dynamic>> {
  BookmakerBuyPage()
      : super(
          wrapper: keepAliveWrapper,
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<BookmakerBuyState>(
              adapter: null, slots: <String, Dependent<BookmakerBuyState>>{}),
          middleware: <Middleware<BookmakerBuyState>>[],
        );
}
