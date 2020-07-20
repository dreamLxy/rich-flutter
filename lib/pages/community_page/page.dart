import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommunityPage extends Page<CommunityState, Map<String, dynamic>> {
  CommunityPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommunityState>(
                adapter: null,
                slots: <String, Dependent<CommunityState>>{
                }),
            middleware: <Middleware<CommunityState>>[
            ],);

}
