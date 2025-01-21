//son can enter his room but father can use son proxy to enter his room

abstract class Room {
  void enter();
}

class SonRoom implements Room {
  @override
  void enter() {
    print("Son is entering his room");
  }
}

class FatherRoomProxy implements Room {
  final SonRoom _sonRoom;

  FatherRoomProxy(this._sonRoom);

  @override
  void enter() {
    print("Father is entering son's room");
    _sonRoom.enter();
  }
}

void main() {
  final sonRoom = SonRoom();
  final fatherRoom = FatherRoomProxy(sonRoom);

  sonRoom.enter();
  fatherRoom.enter();
}
