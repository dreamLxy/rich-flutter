import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class ShowToastEvent {
  String msg;

  ShowToastEvent(String msg) : this.msg = msg;
}
