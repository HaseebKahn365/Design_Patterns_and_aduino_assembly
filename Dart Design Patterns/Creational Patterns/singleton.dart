void main() {
  // Get the singleton instance
  var settings1 = GameSettingsManager();
  var settings2 = GameSettingsManager();

  // Both variables reference the same instance
  print(identical(settings1, settings2)); // true

  // Update settings from anywhere in your code
  settings1.soundEnabled = false;
  print(settings2.soundEnabled); // false

  // Update high score
  settings1.updateHighScore('level1', 1000);
}

//!Singleton with factory constructor
// A GameSettingsManager that needs to be accessed globally
// throughout a mobile game
class GameSettingsManager {
  // Private static instance
  static GameSettingsManager? _instance;

  // Public settings
  bool _soundEnabled = true;
  double _brightness = 0.7;
  String _difficulty = 'medium';
  Map<String, int> _highScores = {};

  // Private constructor
  GameSettingsManager._();

  // Public factory method to get instance
  factory GameSettingsManager() {
    _instance ??= GameSettingsManager._();
    return _instance!;
  }

  // Settings getters and setters
  bool get soundEnabled => _soundEnabled;
  set soundEnabled(bool value) {
    _soundEnabled = value;
    _saveSettings();
  }

  double get brightness => _brightness;
  set brightness(double value) {
    _brightness = value;
    _saveSettings();
  }

  String get difficulty => _difficulty;
  set difficulty(String value) {
    _difficulty = value;
    _saveSettings();
  }

  void updateHighScore(String level, int score) {
    if (!_highScores.containsKey(level) || score > _highScores[level]!) {
      _highScores[level] = score;
      _saveSettings();
    }
  }

  // Mock method to simulate saving settings to storage
  void _saveSettings() {
    print('Saving settings to storage...');
  }
}
