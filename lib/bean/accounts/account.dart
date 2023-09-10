class Account {
  final String acccount;
  final String password;

  const Account({required this.acccount, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'acccount': acccount,
      'password': password,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Account{acccount: $acccount, password: $password}';
  }
}

List<Account> Accounts = [
  Account(acccount: "acccount1", password: "password1"),
  Account(acccount: "acccount2", password: "password1"),
  Account(acccount: "acccount3", password: "password1"),
  Account(acccount: "acccount4", password: "password1"),
  Account(acccount: "acccount5", password: "password1"),
];
