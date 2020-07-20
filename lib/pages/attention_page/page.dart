import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AttentionPage extends Page<AttentionState, Map<String, dynamic>> {
  AttentionPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AttentionState>(
                adapter: null,
                slots: <String, Dependent<AttentionState>>{
                }),
            middleware: <Middleware<AttentionState>>[
            ],);

}
