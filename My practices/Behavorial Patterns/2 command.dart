//command pattern test for captain asking mates to execute commands

abstract class ShoutCommand {
  void doThis();
}

class Mate {
  String name = 'Haseeb';

  void start() {
    print('$name is starting to work');
  }

  void stop() {
    print('$name is stopping the work');
  }
}

class AskMateToStart implements ShoutCommand {
  final Mate mate;

  AskMateToStart(this.mate);

  @override
  void doThis() {
    mate.start();
  }
}

class AskMateToHalt implements ShoutCommand {
  final Mate mate;

  AskMateToHalt(this.mate);

  @override
  void doThis() {
    mate.stop();
  }
}

void main() {
  Mate mate = Mate();

  AskMateToHalt(mate).doThis();
  AskMateToStart(mate).doThis();
}
