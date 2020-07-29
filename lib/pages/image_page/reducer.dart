import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ImageViewState> buildReducer() {
  return asReducer(
    <Object, Reducer<ImageViewState>>{
      ImageViewAction.setCurrentIndex: _setCurrentIndex
    },
  );
}

ImageViewState _setCurrentIndex(ImageViewState state, Action action) {
  final ImageViewState newState = state.clone();
  return newState..currentIndex = action.payload['currentIndex'];
}
