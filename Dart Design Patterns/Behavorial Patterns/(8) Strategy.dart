// Strategy Interface: Attack Strategy
abstract class AttackStrategy {
  void attack();
}

// Concrete Strategy: Bite Attack
class BiteAttack implements AttackStrategy {
  @override
  void attack() {
    print("The animal bites fiercely!");
  }
}

// Concrete Strategy: Claw Attack
class ClawAttack implements AttackStrategy {
  @override
  void attack() {
    print("The animal slashes with sharp claws!");
  }
}

// Concrete Strategy: Roar Attack
class RoarAttack implements AttackStrategy {
  @override
  void attack() {
    print("The animal lets out a deafening roar, intimidating its opponent!");
  }
}

// Context: Animal
class Animal {
  final String name;
  AttackStrategy? _attackStrategy;

  Animal(this.name);

  void setAttackStrategy(AttackStrategy strategy) {
    _attackStrategy = strategy;
    print("$name is now using a new attack strategy.${strategy.runtimeType}");
  }

  void performAttack() {
    if (_attackStrategy == null) {
      print("$name has no attack strategy set!");
    } else {
      print("$name attacks!");
      _attackStrategy!.attack();
    }
  }
}

void main() {
  final lion = Animal("Lion");

  // Lion uses bite attack
  lion.setAttackStrategy(BiteAttack());
  lion.performAttack();

  // Lion switches to claw attack
  lion.setAttackStrategy(ClawAttack());
  lion.performAttack();

  // Add an intimidating roar
  lion.setAttackStrategy(RoarAttack());
  lion.performAttack();
}

/*
Explanation:
Strategy (AttackStrategy): Defines a family of attack behaviors.
Concrete Strategies (BiteAttack, ClawAttack, RoarAttack): Implement specific attack behaviors.
Context (Animal): Uses a strategy and allows dynamic switching of attack behavior.
This example showcases how animals in a game can adapt their attack styles based on the situation.
*/
