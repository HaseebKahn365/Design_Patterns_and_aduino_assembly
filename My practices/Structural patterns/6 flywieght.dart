//donuts mountain example using the flyweight pattern

class Donut {
  final String _flavor;
  final String _icing;
  final String _topping;

  Donut(this._flavor, this._icing, this._topping);

  void display() {
    print("Flavor: $_flavor, Icing: $_icing, Topping: $_topping");
  }
}

class DonutFactory {
  final Map<String, Donut> _donuts = {};

  Donut getDonut(String flavor, String icing, String topping) {
    final key = "$flavor-$icing-$topping";
    if (!_donuts.containsKey(key)) {
      _donuts[key] = Donut(flavor, icing, topping);
    }
    return _donuts[key]!;
  }

  int getDonutCount() {
    return _donuts.length;
  }
}

class PositionedDonut {
  final double _x;
  final double _y;
  final Donut _donut;

  PositionedDonut(this._x, this._y, this._donut);

  void display() {
    print("Donut at ($_x, $_y)");
    _donut.display();
  }
}

class DonutMountain {
  final List<PositionedDonut> _donuts = [];

  void addDonut(double x, double y, String flavor, String icing, String topping, DonutFactory factory) {
    final donut = factory.getDonut(flavor, icing, topping);
    _donuts.add(PositionedDonut(x, y, donut));
  }

  void display() {
    for (var donut in _donuts) {
      donut.display();
    }
  }
}

void main() {
  final factory = DonutFactory();
  final mountain = DonutMountain();

  mountain.addDonut(1, 1, "Chocolate", "Chocolate", "Sprinkles", factory);
  mountain.addDonut(2, 3, "Vanilla", "Vanilla", "Frosting", factory);
  mountain.addDonut(3, 2, "Chocolate", "Chocolate", "Sprinkles", factory);
  mountain.addDonut(3, 2, "Chocolate", "Chocolate", "Sprinkles", factory);
  mountain.addDonut(3, 2, "Chocolate", "Chocolate", "Sprinkles", factory);

  mountain.display();
  print("Donut count: ${factory.getDonutCount()}");
}
