import 'package:fish_redux/fish_redux.dart';

enum ImageViewAction { onGoBack, setCurrentIndex }

class ImageViewActionCreator {
  static Action onGoBack() {
    return const Action(ImageViewAction.onGoBack);
  }
  static Action setCurrentIndex(payload) {
    return Action(ImageViewAction.setCurrentIndex, payload: payload);
  }
}
