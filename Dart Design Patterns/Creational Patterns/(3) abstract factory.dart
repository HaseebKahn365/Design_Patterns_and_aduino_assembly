abstract class Toy {}

class Car extends Toy {
  final String type;
  Car(this.type);
}

class Doll extends Toy {
  final String type;
  Doll(this.type);
}

abstract class ToyFactory {
  Toy makeCar();
  Toy makeDoll();
  // void packageToys(); creating methods like this is also possible and forces changes to be made in all factories
}

class ClassicToyFactory implements ToyFactory {
  @override
  Toy makeCar() => Car('Wooden Car');

  @override
  Toy makeDoll() => Doll('Rag Doll');
}

class ModernToyFactory implements ToyFactory {
  @override
  Toy makeCar() => Car('Electric Car');

  @override
  Toy makeDoll() => Doll('Robot Doll');
}

void main() {
  final classicFactory = ClassicToyFactory();
  final modernFactory = ModernToyFactory();

  final classicCar = classicFactory.makeCar();
  final modernCar = modernFactory.makeCar();

  print((classicCar as Car).type); // Wooden Car
  print((modernCar as Car).type); // Electric Car
}

/*Toy: Represents a general product 
Car and Doll: Specific types of toys 
ToyFactory: A blueprint for factories 
ClassicToyFactory and ModernToyFactory: Two specific factories for creating different styles of toys 
*/