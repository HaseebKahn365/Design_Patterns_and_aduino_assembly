// Observer interface
abstract class Subscriber {
  void update(String videoTitle);
}

// Concrete Observer: Represents a subscriber
class UserSubscriber implements Subscriber {
  final String name;

  UserSubscriber(this.name);

  @override
  void update(String videoTitle) {
    print("Hey $name, a new video titled '$videoTitle' has been uploaded!");
  }
}

// Subject interface
abstract class YouTubeChannel {
  void subscribe(Subscriber subscriber);
  void unsubscribe(Subscriber subscriber);
  void notifySubscribers(String videoTitle);
}

// Concrete Subject: Represents the YouTube channel
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

  // A method to upload a new video
  void uploadVideo(String videoTitle) {
    print("\n$channelName uploaded a new video: $videoTitle");
    notifySubscribers(videoTitle);
  }
}

void main() {
  final channel = MyYouTubeChannel("Tech Insights");

  // Create some subscribers
  final user1 = UserSubscriber("Alice");
  final user2 = UserSubscriber("Bob");
  final user3 = UserSubscriber("Charlie");

  // Subscribe users to the channel
  channel.subscribe(user1);
  channel.subscribe(user2);

  // Upload a new video
  channel.uploadVideo("Understanding Observer Pattern");

  // Unsubscribe a user and upload another video
  channel.unsubscribe(user2);
  channel.uploadVideo("10 Tips for Dart Developers");

  // Subscribe another user
  channel.subscribe(user3);
  channel.uploadVideo("Dart vs Flutter: What's the Difference?");
}

/*
Explanation:
Observer (Subscriber): Represents the subscribers who need to be notified of changes.
Concrete Observer (UserSubscriber): A user who subscribes to the channel and gets notifications.
Subject (YouTubeChannel): Defines methods to manage subscribers and notify them of updates.
Concrete Subject (MyYouTubeChannel): Implements the subject's functionality, managing subscribers and sending updates.
This example mimics a YouTube channel notifying subscribers about new uploads.
*/
