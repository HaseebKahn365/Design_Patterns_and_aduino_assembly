// Subsystems
class TV {
  void turnOn() => print("TV: Turning on...");
  void turnOff() => print("TV: Turning off...");
}

class SoundSystem {
  void setVolume(int level) => print("Sound System: Setting volume to $level...");
  void turnOn() => print("Sound System: Turning on...");
  void turnOff() => print("Sound System: Turning off...");
}

class Lights {
  void dim() => print("Lights: Dimming lights...");
  void brighten() => print("Lights: Brightening lights...");
}

// Facade
class HomeTheaterFacade {
  final TV tv;
  final SoundSystem soundSystem;
  final Lights lights;

  HomeTheaterFacade(this.tv, this.soundSystem, this.lights);

  void watchMovie() {
    print("Getting ready to watch a movie...");
    lights.dim();
    tv.turnOn();
    soundSystem.turnOn();
    soundSystem.setVolume(50);
  }

  void endMovie() {
    print("Shutting down the home theater...");
    lights.brighten();
    soundSystem.turnOff();
    tv.turnOff();
  }
}

// Client
void main() {
  final tv = TV();
  final soundSystem = SoundSystem();
  final lights = Lights();

  final homeTheater = HomeTheaterFacade(tv, soundSystem, lights);

  homeTheater.watchMovie();
  // Output:
  // Getting ready to watch a movie...
  // Lights: Dimming lights...
  // TV: Turning on...
  // Sound System: Turning on...
  // Sound System: Setting volume to 50...

  homeTheater.endMovie();
  // Output:
  // Shutting down the home theater...
  // Lights: Brightening lights...
  // Sound System: Turning off...
  // TV: Turning off...
}

/*
Imagine you have a home theater with a TV, sound system, and lights. 
Instead of operating each device separately, you create a single remote control (facade) that simplifies everything.

 Explanation:
Subsystems (TV, SoundSystem, Lights): Individual components with their own operations.
Facade (HomeTheaterFacade): Simplifies the process by combining multiple steps into a single method (watchMovie or endMovie).
Client: Interacts with the facade instead of directly calling subsystems.
 */
