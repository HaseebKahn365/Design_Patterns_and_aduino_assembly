// Target interface
abstract class Charger {
  void charge();
}

// Adaptee (incompatible interface)
class LightningDevice {
  void chargeWithLightning() {
    print("Charging with Lightning cable...");
  }
}

// Adapter
class LightningToUsbCAdapter implements Charger {
  final LightningDevice device;

  LightningToUsbCAdapter(this.device);

  @override
  void charge() {
    print("Using adapter...");
    device.chargeWithLightning();
  }
}

// Client
class ChargingStation {
  void plugIn(Charger charger) {
    charger.charge();
  }
}

void main() {
  final lightningDevice = LightningDevice();
  final adapter = LightningToUsbCAdapter(lightningDevice);

  final station = ChargingStation();
  station.plugIn(adapter); // Output: Using adapter... Charging with Lightning cable...
}
