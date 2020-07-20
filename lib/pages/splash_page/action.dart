import 'package:fish_redux/fish_redux.dart';

enum SplashAction { action }

class SplashActionCreator {
  static Action onAction() {
    return const Action(SplashAction.action);
  }
}
