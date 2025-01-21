// facade pattern to initalize the ground for a game containing enemies, player and a map

class Enemy {
  void spawn() => print("Enemy: Spawning enemy...");
  void attack() => print("Enemy: Attacking player...");
}

class Player {
  void spawn() => print("Player: Spawning player...");
  void attack() => print("Player: Attacking enemy...");
}

class Map {
  void load() => print("Map: Loading map...");
  void render() => print("Map: Rendering map...");
}

class Game {
  final Enemy _enemy;
  final Player _player;
  final Map _map;

  Game(this._enemy, this._player, this._map);

  void startGame() {
    _enemy.spawn();
    _player.spawn();
    _map.load();
    _map.render();
  }

  void playGame() {
    _player.attack();
    _enemy.attack();
  }
}

void main() {
  final enemy = Enemy();
  final player = Player();
  final map = Map();

  final game = Game(enemy, player, map);

  game.startGame();
  // Output:
  // Enemy: Spawning enemy...
  // Player: Spawning player...
  // Map: Loading map...
  // Map: Rendering map...

  game.playGame();
  // Output:
  // Player: Attacking enemy...
  // Enemy: Attacking player...
}
