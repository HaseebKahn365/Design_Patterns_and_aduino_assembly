//abstract factory builder for the old and new doors

abstract class Door {
  void open();
  void close();
}

class OldDoor implements Door {
  @override
  void open() => print('Old door opened');
  @override
  void close() => print('Old door closed');
}

class NewDoor implements Door {
  @override
  void open() => print('New door opened');
  @override
  void close() => print('New door closed');
}

abstract class DoorFactory {
  Door makeDoor();
}

class OldDoorFactory implements DoorFactory {
  @override
  Door makeDoor() => OldDoor();
}

class NewDoorFactory implements DoorFactory {
  @override
  Door makeDoor() => NewDoor();
}

void main() {
  final oldFactory = OldDoorFactory();
  final newFactory = NewDoorFactory();

  final oldDoor = oldFactory.makeDoor();
  final newDoor = newFactory.makeDoor();

  oldDoor.open();
  oldDoor.close();

  newDoor.open();
  newDoor.close();
}
