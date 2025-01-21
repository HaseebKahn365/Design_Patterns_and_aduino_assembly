abstract class usbTypeCPlug {
  void connect();
}

class oldUsbPlug {
  void connect() {
    print("Connected to old USB plug to old USB port");
  }
}

class usbToTypeCAdapter implements usbTypeCPlug {
  final oldUsbPlug _oldUsbPlug;

  usbToTypeCAdapter(this._oldUsbPlug);

  @override
  void connect() {
    _oldUsbPlug.connect();
    //logic for converting old usb to type c
    print("Connected and old USB port is converted to USB Type C");
  }
}

void main() {
  oldUsbPlug old = oldUsbPlug();
  usbToTypeCAdapter adapter = usbToTypeCAdapter(old);
  adapter.connect();
}
