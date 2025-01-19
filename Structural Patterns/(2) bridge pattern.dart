// Implementor (Style interface)
abstract class DrawingStyle {
  void applyStyle(String shape);
}

// Concrete Implementors (Styles)
class SolidStyle implements DrawingStyle {
  @override
  void applyStyle(String shape) {
    print("Drawing $shape with a solid style.");
  }
}

class DashedStyle implements DrawingStyle {
  @override
  void applyStyle(String shape) {
    print("Drawing $shape with a dashed style.");
  }
}

// Abstraction (Shape interface)
abstract class Shape {
  final DrawingStyle style;

  Shape(this.style);

  void draw();
}

// Refined Abstractions (Specific shapes)
class Circle extends Shape {
  Circle(DrawingStyle style) : super(style);

  @override
  void draw() {
    style.applyStyle("Circle");
  }
}

class Square extends Shape {
  Square(DrawingStyle style) : super(style);

  @override
  void draw() {
    style.applyStyle("Square");
  }
}

// Client
void main() {
  final solidStyle = SolidStyle();
  final dashedStyle = DashedStyle();

  final solidCircle = Circle(solidStyle);
  final dashedSquare = Square(dashedStyle);

  solidCircle.draw(); // Output: Drawing Circle with a solid style.
  dashedSquare.draw(); // Output: Drawing Square with a dashed style.
}


/*
Imagine you’re building a drawing app where users can choose shapes (like a circle or square) and styles (solid or dashed). 
The Bridge Pattern separates the shape logic from the style logic, allowing them to vary independently.
Abstraction (Shape): Represents the high-level concept of a shape.
Implementor (DrawingStyle): Represents how the shapes are styled.
Bridge: Connects shapes and styles so they can vary independently.
Refined Abstractions (Circle, Square): Specific shapes.
Concrete Implementors (SolidStyle, DashedStyle): Specific styles.
 
 */