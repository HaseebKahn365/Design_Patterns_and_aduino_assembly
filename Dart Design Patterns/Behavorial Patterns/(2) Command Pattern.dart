// Command interface
abstract class Command {
  void execute();
}

// Concrete Command: Turn Light On
class LightOnCommand implements Command {
  final Light light;

  LightOnCommand(this.light);

  @override
  void execute() {
    light.turnOn();
  }
}

// Concrete Command: Turn Fan On
class FanOnCommand implements Command {
  final Fan fan;

  FanOnCommand(this.fan);

  @override
  void execute() {
    fan.turnOn();
  }
}

// Receiver classes
class Light {
  void turnOn() {
    print("The light is on!");
  }

  void turnOff() {
    print("The light is off!");
  }
}

class Fan {
  void turnOn() {
    print("The fan is on!");
  }

  void turnOff() {
    print("The fan is off!");
  }
}

// Invoker (Remote Control)
class RemoteControl {
  late Command command;

  void setCommand(Command command) {
    this.command = command;
  }

  void pressButton() {
    command.execute();
  }
}

void main() {
  final light = Light();
  final fan = Fan();

  final lightOn = LightOnCommand(light);
  final fanOn = FanOnCommand(fan);

  final remote = RemoteControl();

  remote.setCommand(lightOn);
  remote.pressButton(); // Output: The light is on!

  remote.setCommand(fanOn);
  remote.pressButton(); // Output: The fan is on!
}


/*

Explanation:
Command interface: Defines a method execute() that all commands implement.
Concrete Command (LightOnCommand, FanOnCommand): Implements the command interface and defines actions to perform on the devices.
Receiver classes (Light, Fan): Represent devices that do the actual work.
Invoker (RemoteControl): Invokes the command to be executed.
 */