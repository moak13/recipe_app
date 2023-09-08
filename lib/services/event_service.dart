import 'package:stacked/stacked.dart';

import '../data_model/event.dart';

class EventService with ListenableServiceMixin {
  // Create a reactive variable to hold the latest event.
  final ReactiveValue<Event?> _currentEvent = ReactiveValue<Event?>(null);
  Event? get currentEvent => _currentEvent.value;

  // Function to add an event and notify listeners.
  void addEvent(Event event) {
    _currentEvent.value = event;
  }
}
