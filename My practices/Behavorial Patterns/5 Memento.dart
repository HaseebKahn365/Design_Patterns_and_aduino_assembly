//memento to keep track of changes to the objects

class StateOfObject {
  final String postion;
  final String color;

  StateOfObject(this.postion, this.color);
}

class Memento {
  final StateOfObject state;

  Memento(this.state);
}

class Originator {
  StateOfObject _state = StateOfObject("0,0", "white");

  void setState(StateOfObject state) {
    _state = state;
  }

  Memento save() {
    return Memento(_state);
  }

  void restore(Memento memento) {
    _state = memento.state;
  }

  void show() {
    print("State: ${_state.postion}, ${_state.color}");
  }
}

class CareTaker {
  final List<Memento> _mementos = [];

  void save(Memento memento) {
    _mementos.add(memento);
  }

  Memento? undo() {
    if (_mementos.isNotEmpty) {
      return _mementos.removeLast();
    }
    return null;
  }
}

void main() {
  final originator = Originator();
  final careTaker = CareTaker();

  // Set the state and save it
  originator.setState(StateOfObject("10,10", "red"));
  careTaker.save(originator.save());
  originator.show();

  // Set the state and save it
  originator.setState(StateOfObject("20,20", "blue"));
  careTaker.save(originator.save());
  originator.show();

  // Set the state and save it
  originator.setState(StateOfObject("30,30", "green"));
  careTaker.save(originator.save());
  originator.show();

  // Undo to the last state
  final memento = careTaker.undo();
  if (memento != null) {
    originator.restore(memento);
  }
  originator.show();

  // Undo to the last state
  final memento2 = careTaker.undo();
  if (memento2 != null) {
    originator.restore(memento2);
  }
  originator.show();
}
