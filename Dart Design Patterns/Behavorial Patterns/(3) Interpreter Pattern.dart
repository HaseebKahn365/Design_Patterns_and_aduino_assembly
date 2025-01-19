// Abstract Expression interface
abstract class Expression {
  int interpret();
}

// Terminal Expression: Represents numbers
class Number implements Expression {
  final int value;

  Number(this.value);

  @override
  int interpret() {
    // Returns the number itself
    return value;
  }
}

// Non-terminal Expression: Addition
class Add implements Expression {
  final Expression left;
  final Expression right;

  Add(this.left, this.right);

  @override
  int interpret() {
    // Interprets by adding the results of left and right expressions
    return left.interpret() + right.interpret();
  }
}

// Non-terminal Expression: Subtraction
class Subtract implements Expression {
  final Expression left;
  final Expression right;

  Subtract(this.left, this.right);

  @override
  int interpret() {
    // Interprets by subtracting the results of right from left expressions
    return left.interpret() - right.interpret();
  }
}

void main() {
  // Represents the expression: (3 + 5) - 2
  final expression = Subtract(
    Add(Number(3), Number(5)), // (3 + 5)
    Number(2), // - 2
  );

  // Interpret the expression
  final result = expression.interpret();
  print("Result: $result"); // Output: Result: 6
}

/*

Abstract Expression: Expression defines the interface (interpret() method) for interpreting expressions.
Terminal Expression: Number represents numbers in the math expression.
Non-terminal Expressions: Add and Subtract represent operations that combine expressions.
Composite Expression: The main expression ((3 + 5) - 2) is built using a combination of terminal and non-terminal expressions


 */    