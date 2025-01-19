// Subject
abstract class BankAccount {
  void withdraw(double amount);
}

// Real Subject
class RealBankAccount implements BankAccount {
  double balance;

  RealBankAccount(this.balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print("Withdrawal successful! Remaining balance: $balance");
    } else {
      print("Insufficient balance!");
    }
  }
}

// Proxy
class ATMProxy implements BankAccount {
  final RealBankAccount _realBankAccount;

  ATMProxy(this._realBankAccount);

  @override
  void withdraw(double amount) {
    print("ATM Proxy: Authenticating user...");
    // Simulate authentication
    if (_authenticate()) {
      _realBankAccount.withdraw(amount);
    } else {
      print("Authentication failed. Access denied.");
    }
  }

  bool _authenticate() {
    // Simulate a successful authentication
    print("User authenticated.");
    return true;
  }
}

// Client
void main() {
  final realAccount = RealBankAccount(1000.0);
  final atm = ATMProxy(realAccount);

  atm.withdraw(300.0); // Valid withdrawal
  atm.withdraw(800.0); // Insufficient balance
  atm.withdraw(100.0); // Another valid withdrawal

  // Output:
  // ATM Proxy: Authenticating user...
  // User authenticated.
  // Withdrawal successful! Remaining balance: 700.0
  // ATM Proxy: Authenticating user...
  // User authenticated.
  // Insufficient balance!
  // ATM Proxy: Authenticating user...
  // User authenticated.
  // Withdrawal successful! Remaining balance: 600.0
}


/*
Explanation:
Subject (BankAccount): Defines the interface for the real object and the proxy.
Real Subject (RealBankAccount): The actual bank account where operations are performed.
Proxy (ATMProxy): Controls access to the real subject, adds authentication, and manages operations.
Client: Interacts with the proxy, unaware of the complexities.
 */