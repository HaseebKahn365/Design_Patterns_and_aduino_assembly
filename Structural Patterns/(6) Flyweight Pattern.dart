// Flyweight
class TreeType {
  final String name;
  final String color;
  final String texture;

  TreeType(this.name, this.color, this.texture);

  void draw(double x, double y) {
    print("Drawing $name tree at ($x, $y) with color $color and texture $texture.");
  }
}

// Flyweight Factory
class TreeFactory {
  static final Map<String, TreeType> _treeTypes = {};

  static TreeType getTreeType(String name, String color, String texture) {
    final key = "$name-$color-$texture";
    if (!_treeTypes.containsKey(key)) {
      _treeTypes[key] = TreeType(name, color, texture);
      print("Creating new TreeType: $key");
    }
    return _treeTypes[key]!;
  }
}

// Context
class Tree {
  final double x;
  final double y;
  final TreeType type;

  Tree(this.x, this.y, this.type);

  void draw() => type.draw(x, y);
}

// Forest (Client)
class Forest {
  final List<Tree> trees = [];

  void plantTree(double x, double y, String name, String color, String texture) {
    final type = TreeFactory.getTreeType(name, color, texture);
    trees.add(Tree(x, y, type));
  }

  void draw() {
    for (var tree in trees) {
      tree.draw();
    }
  }
}

// Client Code
void main() {
  final forest = Forest();

  forest.plantTree(1, 1, "Oak", "Green", "Rough");
  forest.plantTree(2, 3, "Pine", "Dark Green", "Smooth");
  forest.plantTree(5, 7, "Oak", "Green", "Rough"); // Shares existing Oak type
  forest.plantTree(8, 9, "Pine", "Dark Green", "Smooth"); // Shares existing Pine type

  forest.draw();
}

/*
Flyweight (TreeType): Represents shared, immutable tree data (type, color, texture).
Flyweight Factory (TreeFactory): Ensures shared instances of TreeType are reused.
Context (Tree): Contains extrinsic data (location) and uses shared TreeType.
Client (Forest): Manages and renders trees efficiently by leveraging shared data.
This pattern minimizes memory usage by sharing large amounts of similar data across objects. Perfect for scenarios like rendering forests, particle systems, or fonts.
 */

