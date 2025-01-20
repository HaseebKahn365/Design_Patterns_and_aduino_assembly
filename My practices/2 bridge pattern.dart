//a bridge pattern for keyboard backlits

abstract class KeyboardBackLit {
  void useBackLit();
}

class whiteBackLit implements KeyboardBackLit {
  @override
  void useBackLit() {
    print("White backlit is on");
  }
}

class rgbBackLit implements KeyboardBackLit {
  @override
  void useBackLit() {
    print("RGB backlit is on");
  }
}

abstract class Keyboard {
  KeyboardBackLit _keyboardBackLit;

  Keyboard(this._keyboardBackLit);

  void useKeyboard();
}

//concrete keyboards

class gamingKeyboard extends Keyboard {
  gamingKeyboard(KeyboardBackLit keyboardBackLit) : super(keyboardBackLit);

  @override
  void useKeyboard() {
    print("Gaming keyboard is being used");
    _keyboardBackLit.useBackLit();
  }
}

class laptopKeyboard extends Keyboard {
  laptopKeyboard(KeyboardBackLit keyboardBackLit) : super(keyboardBackLit);

  @override
  void useKeyboard() {
    print("Laptop keyboard is being used");
    _keyboardBackLit.useBackLit();
  }
}

void main() {
  final whiteBackLit white = whiteBackLit();
  final rgbBackLit rgb = rgbBackLit();

  final gamingKeyboard gaming = gamingKeyboard(white);
  final laptopKeyboard laptop = laptopKeyboard(rgb);

  gaming.useKeyboard();
  laptop.useKeyboard();
}
