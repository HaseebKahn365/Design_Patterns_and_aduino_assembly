class GameCharacter {
  String name;
  String weaponType;
  String armorType;
  int health;
  String specialAbility;

  GameCharacter({
    required this.name,
    required this.weaponType,
    required this.armorType,
    required this.health,
    required this.specialAbility,
  });
}

abstract class CharacterBuilder {
  void setName(String name);
  void setWeapon(String weapon);
  void setArmor(String armor);
  void setHealth(int health);
  void setSpecialAbility(String ability);
  GameCharacter build();
}

class WarriorBuilder implements CharacterBuilder {
  late String _name;
  String _weaponType = "Sword";
  String _armorType = "Heavy Armor";
  int _health = 100;
  String _specialAbility = "Berserk";

  @override
  void setName(String name) => _name = name;
  @override
  void setWeapon(String weapon) => _weaponType = weapon;
  @override
  void setArmor(String armor) => _armorType = armor;
  @override
  void setHealth(int health) => _health = health;
  @override
  void setSpecialAbility(String ability) => _specialAbility = ability;

  @override
  GameCharacter build() {
    return GameCharacter(
      name: _name,
      weaponType: _weaponType,
      armorType: _armorType,
      health: _health,
      specialAbility: _specialAbility,
    );
  }
}

//lets use the builder

void main() {
  final warriorBuilder = WarriorBuilder();
  warriorBuilder.setName("Haseeb");
  warriorBuilder.setWeapon("Axe");
  warriorBuilder.setArmor("Light Armor");
  warriorBuilder.setHealth(150);
  warriorBuilder.setSpecialAbility("Rage");

  final Haseeb = warriorBuilder.build();
  print(Haseeb.name); // Haseeb
  print(Haseeb.weaponType); // Axe
  print(Haseeb.armorType); // Light Armor
  print(Haseeb.health); // 150
  print(Haseeb.specialAbility); // Rage
}
