abstract class GameObjectPrototype {
  GameObjectPrototype clone();
}

class Enemy implements GameObjectPrototype {
  String type;
  int health;
  Map<String, dynamic> attributes;

  Enemy(this.type, this.health, this.attributes);

  @override
  Enemy clone() {
    return Enemy(
      type,
      health,
      Map<String, dynamic>.from(attributes),
    );
  }
}

class PowerUp implements GameObjectPrototype {
  String effect;
  int duration;
  Map<String, dynamic> properties;

  PowerUp(this.effect, this.duration, this.properties);

  @override
  PowerUp clone() {
    return PowerUp(
      effect,
      duration,
      Map<String, dynamic>.from(properties),
    );
  }
}

//lets use
void main() {
  final enemy = Enemy('Orc', 100, {'damage': 20, 'speed': 10});
  final enemyClone = enemy.clone();

  print(enemy.type == enemyClone.type); // true
  print(enemy.health == enemyClone.health); // true
  print(enemy.attributes == enemyClone.attributes); // false

  final powerUp = PowerUp('Shield', 30, {'strength': 10, 'duration': 30});
  final powerUpClone = powerUp.clone();

  print(powerUp.effect == powerUpClone.effect); // true
  print(powerUp.duration == powerUpClone.duration); // true
  print(powerUp.properties == powerUpClone.properties); // false
}
