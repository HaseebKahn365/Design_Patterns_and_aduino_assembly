//mediator pattern for an inventory to keep track of who brought what.

abstract class Inventory {
  void addProduct(Product product);
  void showProducts();
}

class InventoryImpl implements Inventory {
  List<Product> products = [];

  @override
  void addProduct(Product product) {
    products.add(product);
  }

  @override
  void showProducts() {
    for (Product product in products) {
      print("${product.name} brought by ${product.user.name}");
    }
  }
}

class Product {
  final String name;
  final User user;

  Product(this.name, this.user);
}

class User {
  final String name;
  final Inventory inventory;

  User(this.name, this.inventory);

  void addProduct(String productName) {
    inventory.addProduct(Product(productName, this));
  }
}

void main() {
  final inventory = InventoryImpl();

  final user1 = User("Alice", inventory);
  final user2 = User("Bob", inventory);

  user1.addProduct("Apple");
  user2.addProduct("Banana");

  inventory.showProducts();

  user1.addProduct("Orange");

  inventory.showProducts();

  user2.addProduct("Grapes");

  inventory.showProducts();
}
