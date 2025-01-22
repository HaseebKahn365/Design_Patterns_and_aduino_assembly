//this is a complicated scenario in which we are going to connect two players together using notification and responses recieved among them
/*
Following are the stages of connection:
1. sending notification.
2. friend has recieved the notification
3. friend has joined the game or friend rejected
4. friend has played first move.
 */

abstract class Connection extends ChangeNotifier {
  void sendNotification(String message);
  void friendReceivedNotification();
  void friendJoinedGame();
  void friendRejected();
  void friendPlayedFirstMove();
}

class ChangeNotifier {
  void notifyListeners() {
    print("Notifying listeners...");
  }
}

enum ConnectionState {
  notificationSent,
  friendReceivedNotification,
  friendJoinedGame,
  friendRejected,
  friendPlayedFirstMove,
}

class GameConnection extends Connection {
  ConnectionState _state = ConnectionState.notificationSent;

  @override
  void sendNotification(String message) {
    print("Notification sent: $message");
    _state = ConnectionState.friendReceivedNotification;
    notifyListeners();
  }

  @override
  void friendReceivedNotification() {
    if (_state == ConnectionState.friendReceivedNotification) {
      print("Friend has received the notification.");
      _state = ConnectionState.friendJoinedGame;
    } else {
      print("Friend has not received the notification yet.");
    }
  }

  @override
  void friendJoinedGame() {
    if (_state == ConnectionState.friendJoinedGame) {
      print("Friend has joined the game.");
      _state = ConnectionState.friendPlayedFirstMove;
    } else {
      print("Friend has not joined the game yet.");
    }
  }

  @override
  void friendRejected() {
    if (_state == ConnectionState.friendRejected) {
      print("Friend has rejected the game.");
    } else {
      print("Friend has not rejected the game yet.");
    }
  }

  @override
  void friendPlayedFirstMove() {
    if (_state == ConnectionState.friendPlayedFirstMove) {
      print("Friend has played the first move.");
    } else {
      print("Friend has not played the first move yet.");
    }
  }
}

void main() {
  final connection = GameConnection();
  connection.sendNotification("You have been invited to play a game.");
  connection.friendReceivedNotification();
  connection.friendJoinedGame();
  connection.friendPlayedFirstMove();
}

//Throwing exceptions

class SendingNotificationException implements Exception {
  final String message;

  SendingNotificationException(this.message);

  @override
  String toString() => "SendingNotificationException: $message";
}

class ReceivingNotificationException implements Exception {
  final String message;

  ReceivingNotificationException(this.message);

  @override
  String toString() => "ReceivingNotificationException: $message";
}

class JoiningGameException implements Exception {
  final String message;

  JoiningGameException(this.message);

  @override
  String toString() => "JoiningGameException: $message";
}

class RejectingGameException implements Exception {
  final String message;

  RejectingGameException(this.message);

  @override
  String toString() => "RejectingGameException: $message";
}

class PlayingFirstMoveException implements Exception {
  final String message;

  PlayingFirstMoveException(this.message);

  @override
  String toString() => "PlayingFirstMoveException: $message";
}
