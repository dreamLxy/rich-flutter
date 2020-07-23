import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class ShowToastEvent {
  String msg;
  static const String serverError = '网络连接超时';

  ShowToastEvent(String msg) : this.msg = msg;
}
