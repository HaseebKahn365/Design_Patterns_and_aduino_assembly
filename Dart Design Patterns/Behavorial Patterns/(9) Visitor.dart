// Visitor Interface
abstract class SpaceVisitor {
  void visitPlanet(Planet planet);
  void visitAsteroid(Asteroid asteroid);
  void visitComet(Comet comet);
}

// Element Interface
abstract class CelestialObject {
  void accept(SpaceVisitor visitor);
}

// Concrete Element: Planet
class Planet implements CelestialObject {
  final String name;
  final String atmosphereType;

  Planet(this.name, this.atmosphereType);

  @override
  void accept(SpaceVisitor visitor) {
    visitor.visitPlanet(this);
  }
}

// Concrete Element: Asteroid
class Asteroid implements CelestialObject {
  final String composition;

  Asteroid(this.composition);

  @override
  void accept(SpaceVisitor visitor) {
    visitor.visitAsteroid(this);
  }
}

// Concrete Element: Comet
class Comet implements CelestialObject {
  final String tailLength;

  Comet(this.tailLength);

  @override
  void accept(SpaceVisitor visitor) {
    visitor.visitComet(this);
  }
}

// Concrete Visitor: Scientific Analysis Tool
class ScienceTool implements SpaceVisitor {
  @override
  void visitPlanet(Planet planet) {
    print("Analyzing Planet '${planet.name}' with ${planet.atmosphereType} atmosphere.");
  }

  @override
  void visitAsteroid(Asteroid asteroid) {
    print("Examining asteroid composed of ${asteroid.composition}.");
  }

  @override
  void visitComet(Comet comet) {
    print("Studying comet with a tail length of ${comet.tailLength} km.");
  }
}

// Concrete Visitor: Mining Tool
class MiningTool implements SpaceVisitor {
  @override
  void visitPlanet(Planet planet) {
    print("Surveying Planet '${planet.name}' for mining potential.");
  }

  @override
  void visitAsteroid(Asteroid asteroid) {
    print("Extracting minerals from an asteroid composed of ${asteroid.composition}.");
  }

  @override
  void visitComet(Comet comet) {
    print("Harvesting ice from a comet with a tail length of ${comet.tailLength} km.");
  }
}

void main() {
  // Create celestial objects
  final earth = Planet("Earth", "Nitrogen-Oxygen");
  final asteroid = Asteroid("Iron and Nickel");
  final comet = Comet("1.5 million");

  // Create tools (visitors)
  final scienceTool = ScienceTool();
  final miningTool = MiningTool();

  // Interact with celestial objects using different tools
  print("Using the Science Tool:");
  earth.accept(scienceTool);
  asteroid.accept(scienceTool);
  comet.accept(scienceTool);

  print("\nUsing the Mining Tool:");
  earth.accept(miningTool);
  asteroid.accept(miningTool);
  comet.accept(miningTool);
}

/*
Explanation:
Visitor (SpaceVisitor): Defines operations for different celestial objects.
Concrete Visitors (ScienceTool, MiningTool): Implement specific behaviors for interacting with celestial objects.
Element Interface (CelestialObject): Allows objects to accept visitors.
Concrete Elements (Planet, Asteroid, Comet): Implement accept method to work with visitors.
This example depicts how astronauts interact with celestial objects using tools, demonstrating the Visitor Pattern.
*/
