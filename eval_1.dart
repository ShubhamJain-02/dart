//You are building a game where players can choose between different character classes, such as
// Warrior, Mage, and Rogue. Each character class has unique abilities and attributes. Implement the
// character classes using inheritance, with a base class Character and subclasses Warrior, Mage, and
// Rogue. Ensure each subclass has its own set of abilities and characteristics.
// Create a Logger mixin that provides logging functionality to classes in your application. The Logger
// mixin should include methods for logging debug, info, warning, and error messages. Implement this
// mixin in various classes throughout your application to enable logging functionality wherever
// needed.
mixin LoggerMixin {
  void logDebug(String message) {
    print('DEBUG: ${runtimeType.toString()} - $message');
  }

  void logInfo(String message, int health) {
    print(
        'INFO: ${runtimeType.toString()} - $message \nCurrent health: $health');
  }

  void logWarning(String message) {
    print('WARNING: ${runtimeType.toString()} - $message');
  }

  void logError(String message) {
    print('ERROR: ${runtimeType.toString()} - $message');
  }
}

class Character with LoggerMixin {
  String name;
  int health;

  Character(this.name, this.health);

  void attack() {
    this.health += 10;
  }

  void defend() {
    this.health -= 10;
  }

  void status() {
    if (this.health <= 0) {
      print("$runtimeType died");
    }
  }
}

class Warrior extends Character {
  int strength;

  Warrior(String name, int health, this.strength) : super(name, health);

  @override
  void attack() {
    super.attack();
    logInfo('Attacking with a powerful strike!', this.health);
  }

  @override
  void defend() {
    super.defend();
    logInfo('Defending with a sturdy shield!', this.health);
    super.status();
  }
}

class Mage extends Character {
  int magicPower;

  Mage(String name, int health, this.magicPower) : super(name, health);

  @override
  void attack() {
    super.attack();
    logInfo('Casting a magical spell!', this.health);
  }

  @override
  void defend() {
    super.defend();
    logInfo('Creating a protective magical barrier!', this.health);
    super.status();
  }
}

class Rogue extends Character {
  int agility;

  Rogue(String name, int health, this.agility) : super(name, health);

  @override
  void attack() {
    super.attack();
    logInfo('Performing a swift and precise attack!', this.health);
  }

  @override
  void defend() {
    super.defend();
    logInfo('Dodging incoming attacks with agility!', this.health);
    super.status();
  }
}

void main() {
  var warrior = Warrior('Warrior1', 100, 20);
  var mage = Mage('Mage1', 10, 30);
  var rogue = Rogue('Rogue1', 90, 25);

  warrior.attack();
  mage.defend();
  rogue.logDebug('This is a debug message.');
}
