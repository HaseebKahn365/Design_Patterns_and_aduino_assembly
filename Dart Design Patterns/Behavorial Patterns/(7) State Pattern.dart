// State interface
abstract class TrafficLightState {
  void handle(TrafficLight trafficLight);
  String getColor();
}

// Concrete State: Red Light
class RedLight implements TrafficLightState {
  @override
  void handle(TrafficLight trafficLight) {
    print("Red Light: Stop!");
    trafficLight.setState(YellowLight()); // Transition to Yellow
  }

  @override
  String getColor() => "Red";
}

// Concrete State: Yellow Light
class YellowLight implements TrafficLightState {
  @override
  void handle(TrafficLight trafficLight) {
    print("Yellow Light: Get Ready...");
    trafficLight.setState(GreenLight()); // Transition to Green
  }

  @override
  String getColor() => "Yellow";
}

// Concrete State: Green Light
class GreenLight implements TrafficLightState {
  @override
  void handle(TrafficLight trafficLight) {
    print("Green Light: Go!");
    trafficLight.setState(RedLight()); // Transition to Red
  }

  @override
  String getColor() => "Green";
}

// Context: Traffic Light
class TrafficLight {
  TrafficLightState _state;

  TrafficLight(this._state);

  void setState(TrafficLightState state) {
    _state = state;
  }

  void change() {
    _state.handle(this);
  }

  void showCurrentLight() {
    print("Current Light: ${_state.getColor()}");
  }
}

void main() {
  // Start with Red Light
  final trafficLight = TrafficLight(RedLight());

  // Cycle through the states
  for (int i = 0; i < 6; i++) {
    trafficLight.showCurrentLight();
    trafficLight.change();
  }
}

/*
Explanation:
State (TrafficLightState): Defines the interface for all possible states.
Concrete States (RedLight, YellowLight, GreenLight): Implement behaviors specific to each state and define transitions to the next state.
Context (TrafficLight): Maintains a reference to the current state and allows state transitions via the state interface.
This example mimics a real-world traffic light system, showcasing the power of the State Pattern.


*/
