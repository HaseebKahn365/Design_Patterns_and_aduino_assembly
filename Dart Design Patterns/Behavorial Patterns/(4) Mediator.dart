// Mediator Interface
abstract class ChatRoom {
  void showMessage(String message, User user);
}

// Concrete Mediator
class ChatRoomImpl implements ChatRoom {
  @override
  void showMessage(String message, User user) {
    // The chat room displays the message and user details
    print("${user.name}: $message");
  }
}

// Colleague Class
class User {
  final String name;
  final ChatRoom chatRoom;

  User(this.name, this.chatRoom);

  void sendMessage(String message) {
    // Sends a message via the mediator (Chat Room)
    chatRoom.showMessage(message, this);
  }
}

void main() {
  // Create a chat room (mediator)
  final chatRoom = ChatRoomImpl();

  // Create users and register them to the chat room
  final user1 = User("Alice", chatRoom);
  final user2 = User("Bob", chatRoom);

  // Users send messages through the chat room
  user1.sendMessage("Hi, Bob!"); // Output: Alice: Hi, Bob!
  user2.sendMessage("Hello, Alice!"); // Output: Bob: Hello, Alice!
}
