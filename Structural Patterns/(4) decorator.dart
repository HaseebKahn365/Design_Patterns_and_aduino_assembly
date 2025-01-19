// Component
abstract class IceCream {
  String getDescription();
  double getCost();
}

// Concrete Component
class PlainIceCream implements IceCream {
  @override
  String getDescription() => "Plain Ice Cream";

  @override
  double getCost() => 50.0;
}

// Decorator
abstract class IceCreamDecorator implements IceCream {
  final IceCream iceCream;

  IceCreamDecorator(this.iceCream);
}

// Concrete Decorators
class ChocolateSyrup extends IceCreamDecorator {
  ChocolateSyrup(IceCream iceCream) : super(iceCream);

  @override
  String getDescription() => "${iceCream.getDescription()} + Chocolate Syrup";

  @override
  double getCost() => iceCream.getCost() + 20.0;
}

class Sprinkles extends IceCreamDecorator {
  Sprinkles(IceCream iceCream) : super(iceCream);

  @override
  String getDescription() => "${iceCream.getDescription()} + Sprinkles";

  @override
  double getCost() => iceCream.getCost() + 15.0;
}

class Nuts extends IceCreamDecorator {
  Nuts(IceCream iceCream) : super(iceCream);

  @override
  String getDescription() => "${iceCream.getDescription()} + Nuts";

  @override
  double getCost() => iceCream.getCost() + 25.0;
}

// Client
void main() {
  IceCream iceCream = PlainIceCream();
  print("${iceCream.getDescription()} costs ${iceCream.getCost()} PKR");

  iceCream = ChocolateSyrup(iceCream);
  print("${iceCream.getDescription()} costs ${iceCream.getCost()} PKR");

  iceCream = Sprinkles(iceCream);
  print("${iceCream.getDescription()} costs ${iceCream.getCost()} PKR");

  iceCream = Nuts(iceCream);
  print("${iceCream.getDescription()} costs ${iceCream.getCost()} PKR");

  // Output:
  // Plain Ice Cream costs 50.0 PKR
  // Plain Ice Cream + Chocolate Syrup costs 70.0 PKR
  // Plain Ice Cream + Chocolate Syrup + Sprinkles costs 85.0 PKR
  // Plain Ice Cream + Chocolate Syrup + Sprinkles + Nuts costs 110.0 PKR
}
