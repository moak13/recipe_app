import '../enums/event_type.dart';

class Event {
  EventType? type;
  dynamic payload;

  Event({
    this.type,
    this.payload,
  });
}
