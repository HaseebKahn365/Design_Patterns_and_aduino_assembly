//a game that allows a group to play together. when any player wants to play, all the other players are notified based on their uuids

abstract class Subscriber {
  void update(String videoTitle);
}

class UserSubscriber implements Subscriber {
  final String name;
  final String uuid;

  UserSubscriber(this.name, this.uuid);

  @override
  void update(String videoTitle) {
    print("Hey $name, a new video titled '$videoTitle' has been uploaded!");
  }
}

abstract class YouTubeChannel {
  void subscribe(Subscriber subscriber);
  void unsubscribe(Subscriber subscriber);
  void notifySubscribers(String videoTitle);
}

class MyYouTubeChannel implements YouTubeChannel {
  final String channelName;
  final List<Subscriber> _subscribers = [];

  MyYouTubeChannel(this.channelName);

  @override
  void subscribe(Subscriber subscriber) {
    _subscribers.add(subscriber);
    print("${(subscriber as UserSubscriber).name} subscribed to $channelName.");
  }

  @override
  void unsubscribe(Subscriber subscriber) {
    _subscribers.remove(subscriber);
    print("${(subscriber as UserSubscriber).name} unsubscribed from $channelName.");
  }

  @override
  void notifySubscribers(String videoTitle) {
    print("\nNotifying all subscribers about: $videoTitle");
    for (var subscriber in _subscribers) {
      subscriber.update(videoTitle);
    }
  }

  void uploadVideo(String videoTitle) {
    print("\n$channelName uploaded a new video: $videoTitle");
    notifySubscribers(videoTitle);
  }
}

void main() {
  final channel = MyYouTubeChannel("Tech Insights");
  final subscriber1 = UserSubscriber("Haseeb", "1234");
  final subscriber2 = UserSubscriber("Bloby", "5678");

  channel.subscribe(subscriber1);
  channel.subscribe(subscriber2);

  channel.uploadVideo("Dart Design Patterns");
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// Subject/Observable

/*
class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();  // Notifies observers
  }
}

// Usage in Widget (Observer)
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(  // Observer
      builder: (context, counter, child) {
        return Text('${counter.count}');
      },
    );
  }
}

// Setup
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: CounterWidget(),
    );
  }
}

*/