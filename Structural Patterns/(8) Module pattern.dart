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


/*

Explanation:
Private Members: _items is a private list that stores the items in the inventory.
Public Methods: Only methods like addItem, removeItem, and listItems are exposed for interaction.
Encapsulation: Internal state (e.g., _items) is protected, ensuring controlled access and modification.
Key Benefits of the Module Pattern:
Encapsulation: Keeps private data hidden and only exposes what’s necessary.
Maintainability: Organizes related code in a modular way, making it easier to manage.
Reusability: Modules can be reused in other parts of your application.
Would you like to dive deeper into this pattern or move on to Behavioral Design Patterns? 😊
 */