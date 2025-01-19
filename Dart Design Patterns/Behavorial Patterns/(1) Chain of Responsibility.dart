// Handler Interface
abstract class RequestHandler {
  RequestHandler? nextHandler;

  void setNext(RequestHandler handler) {
    nextHandler = handler;
  }

  void handle(String request);
}

// Concrete Handlers
class AuthenticationHandler extends RequestHandler {
  @override
  void handle(String request) {
    if (request == "Authenticate") {
      print("Authentication successful.");
    } else {
      nextHandler?.handle(request);
    }
  }
}

class LoggingHandler extends RequestHandler {
  @override
  void handle(String request) {
    print("Logging request: $request");
    nextHandler?.handle(request);
  }
}

class GameRuleHandler extends RequestHandler {
  @override
  void handle(String request) {
    if (request == "Attack") {
      print("Applying game rules for attack action.");
    } else {
      print("Unknown request: $request");
    }
  }
}

// Client Code
void main() {
  final authHandler = AuthenticationHandler();
  final loggingHandler = LoggingHandler();
  final gameRuleHandler = GameRuleHandler();

  // Set up the chain
  authHandler.setNext(loggingHandler);
  loggingHandler.setNext(gameRuleHandler);

  // Test the chain
  authHandler.handle("Authenticate"); // Authentication handled
  authHandler.handle("Attack"); // Logged and processed by game rules
  authHandler.handle("Defend"); // Logged and not recognized by any handler
}

/*
Explanation:
Abstraction (Shape): Represents the high-level concept of a shape.
Implementor (DrawingStyle): Represents how the shapes are styled.
Bridge: Connects shapes and styles so they can vary independently.
Refined Abstractions (Circle, Square): Specific shapes.
Concrete Implementors (SolidStyle, DashedStyle): Specific styles.
 */