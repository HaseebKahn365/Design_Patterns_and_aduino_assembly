//shooter strategy for shooters in the game:

abstract class ShootingStrategy {
  void shoot();
}

class PistolShooting implements ShootingStrategy {
  @override
  void shoot() {
    print("Pistol shooting");
  }
}

class RifleShooting implements ShootingStrategy {
  @override
  void shoot() {
    print("Rifle shooting");
  }
}

class SniperShooting implements ShootingStrategy {
  @override
  void shoot() {
    print("Sniper shooting");
  }
}

class Shooter {
  final String name;
  ShootingStrategy? _shootingStrategy;

  Shooter(this.name);

  void setShootingStrategy(ShootingStrategy strategy) {
    _shootingStrategy = strategy;
    print("$name is now using a new shooting strategy: ${strategy.runtimeType}");
  }

  void performShooting() {
    if (_shootingStrategy == null) {
      print("$name has no shooting strategy set!");
    } else {
      print("$name is shooting!");
      _shootingStrategy!.shoot();
    }
  }
}

void main() {
  final shooter = Shooter("Shooter");

  //shooter uses pistol shooting
  shooter.setShootingStrategy(PistolShooting());
  shooter.performShooting();

  //shooter switches to rifle shooting
  shooter.setShootingStrategy(RifleShooting());
  shooter.performShooting();

  //shooter switches to sniper shooting
  shooter.setShootingStrategy(SniperShooting());
  shooter.performShooting();
}
