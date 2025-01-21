// Support ticket handler interface
abstract class SupportHandler {
  SupportHandler? nextHandler;

  void setNext(SupportHandler handler) {
    nextHandler = handler;
  }

  void handleTicket(String issue, int priority);
}

// Level 1 Support - Junior Support
class JuniorSupport extends SupportHandler {
  @override
  void handleTicket(String issue, int priority) {
    if (priority <= 1) {
      print('Junior Support handles the issue: $issue');
    } else if (nextHandler != null) {
      print('Junior Support escalates the issue...');
      nextHandler!.handleTicket(issue, priority);
    }
  }
}

// Level 2 Support - Senior Support
class SeniorSupport extends SupportHandler {
  @override
  void handleTicket(String issue, int priority) {
    if (priority <= 2) {
      print('Senior Support handles the issue: $issue');
    } else if (nextHandler != null) {
      print('Senior Support escalates the issue...');
      nextHandler!.handleTicket(issue, priority);
    }
  }
}

// Level 3 Support - Team Lead
class TeamLead extends SupportHandler {
  @override
  void handleTicket(String issue, int priority) {
    print('Team Lead handles the critical issue: $issue');
  }
}

// Usage example
void main() {
  var junior = JuniorSupport();
  var senior = SeniorSupport();
  var teamLead = TeamLead();

  // Set up the chain
  junior.setNext(senior);
  senior.setNext(teamLead);

  // Test different priority tickets
  print('\nProcessing priority 1 ticket:');
  junior.handleTicket('Password reset', 1);

  print('\nProcessing priority 2 ticket:');
  junior.handleTicket('Database connection issue', 2);

  print('\nProcessing priority 3 ticket:');
  junior.handleTicket('Production server down', 1);
}
