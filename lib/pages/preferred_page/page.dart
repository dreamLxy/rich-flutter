import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'components.dart';

class PreferredPage extends Page<PreferredState, Map<String, dynamic>> {
  PreferredPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<PreferredState>(
              adapter: null, slots: <String, Dependent<PreferredState>>{}),
          middleware: <Middleware<PreferredState>>[],
        );

  @override
  ComponentState<PreferredState> createState() {
    return PreferredComponent();
  }
}
