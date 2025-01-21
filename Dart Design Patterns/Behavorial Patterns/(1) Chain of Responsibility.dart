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
The Chain of Responsibility pattern is a behavioral design pattern that allows an object to pass a request along a chain of handlers.
 Each handler in the chain decides either to process the request or to pass it along to the next handler in the chain.
  In this example, we have three concrete handlers: AuthenticationHandler, LoggingHandler, and GameRuleHandler.
    The AuthenticationHandler checks if the request is for authentication and processes it if it is.
      If the request is not for authentication, it passes the request to the next handler in the chain.
      The LoggingHandler logs the request and passes it along to the next handler.
        The GameRuleHandler applies game rules for the "Attack" action and handles unknown requests.
        The client code sets up the chain of handlers and tests it by sending different requests through the chain.

Output:
Authentication successful.
Logging request: Authenticate
Applying game rules for attack action.
Logging request: Attack
Unknown request: Defend
*/