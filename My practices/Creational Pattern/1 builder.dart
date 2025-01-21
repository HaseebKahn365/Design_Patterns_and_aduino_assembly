//builder pattern for events in a certain room.
//ie topic, attendees, date, time, location, etc.

class Event {
  String topic;
  List<String> attendees;
  DateTime date;
  String time;
  String location;

  Event(this.topic, this.attendees, this.date, this.time, this.location);

  @override
  String toString() {
    return 'Event{topic: $topic, attendees: $attendees, date: $date, time: $time, location: $location}';
  }
}

abstract class EventBuilder {
  void setTopic();
  void setAttendees();
  void setDate();
  void setTime();
  void setLocation();
}

class GDCEventBuilder implements EventBuilder {
  late String _topic;
  late List<String> _attendees;
  late DateTime _date;
  late String _time;
  late String _location;

  @override
  void setTopic() {
    _topic = "GDG Event";
  }

  @override
  void setAttendees() {
    _attendees = ["John", "Jane", "Doe"];
  }

  @override
  void setDate() {
    _date = DateTime.now();
  }

  @override
  void setTime() {
    _time = "6:00 PM";
  }

  @override
  void setLocation() {
    _location = "Googleplex";
  }

  Event build() {
    return Event(_topic, _attendees, _date, _time, _location);
  }
}

class MicrosoftBuildEventBuilder implements EventBuilder {
  late Event event;

  @override
  void setTopic() {
    event.topic = "Microsoft Build Event";
  }

  @override
  void setAttendees() {
    event.attendees = ["John", "Jane", "Doe"];
  }

  @override
  void setDate() {
    event.date = DateTime.now();
  }

  @override
  void setTime() {
    event.time = "6:00 PM";
  }

  @override
  void setLocation() {
    event.location = "Microsoft Campus";
  }

  Event build() {
    return event;
  }
}

void main() {
  final eventBuilder = GDCEventBuilder();
  eventBuilder.setTopic();
  eventBuilder.setAttendees();
  eventBuilder.setDate();
  eventBuilder.setTime();
  eventBuilder.setLocation();

  final event = eventBuilder.build();
  print(event);
}
