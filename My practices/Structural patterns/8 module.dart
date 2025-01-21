//managing a list of objects in a module

class InventoryModule {
  // Private properties
  final List<String> _items = [];

  // Public methods
  void addItem(String item) {
    _items.add(item);
    print("$item added to inventory.");
  }

  void removeItem(String item) {
    if (_items.contains(item)) {
      _items.remove(item);
      print("$item removed from inventory.");
    } else {
      print("$item is not in the inventory.");
    }
  }

  void listItems() {
    if (_items.isEmpty) {
      print("Inventory is empty.");
    } else {
      print("Inventory contains: ${_items.join(', ')}");
    }
  }
}

// Client Code

void main() {
  final inventory = InventoryModule();

  inventory.addItem("Sword");
  inventory.addItem("Shield");
  inventory.listItems(); // Output: Inventory contains: Sword, Shield
  inventory.removeItem("Sword");
  inventory.listItems(); // Output: Inventory contains: Shield
}
