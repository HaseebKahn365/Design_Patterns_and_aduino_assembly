// Target interface
abstract class Socket {
  void providePower();
}

// Adaptee (incompatible plug)
class TwoPinPlug {
  void useTwoPins() {
    print("Using a two-pin plug for power...");
  }
}

// Adapter
class TwoPinToThreePinAdapter implements Socket {
  final TwoPinPlug plug;

  TwoPinToThreePinAdapter(this.plug);

  @override
  void providePower() {
    print("Adapter in use...");
    plug.useTwoPins();
  }
}

// Client
class ThreePinSocket {
  void plugIn(Socket socket) {
    socket.providePower();
  }
}

//a socket has holes and a plug has pins, the adapter is used to connect the two pins to the three holes

void main() {
  final twoPinPlug = TwoPinPlug();
  final adapter = TwoPinToThreePinAdapter(twoPinPlug);

  final socket = ThreePinSocket();
  socket.plugIn(adapter); // Output: Adapter in use... Using a two-pin plug for power...
}
