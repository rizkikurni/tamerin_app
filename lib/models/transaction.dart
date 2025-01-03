class Transaction {
  final int? id;
  final String type;
  final String name;
  final String category;
  final DateTime date;
  final int amount;
  final int balance;

  Transaction({
    this.id,
    required this.type,
    required this.name,
    required this.category,
    required this.date,
    required this.amount,
    required this.balance,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'category': category,
      'date': date.toIso8601String(),
      'amount': amount,
      'balance': balance,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      type: map['type'],
      name: map['name'],
      category: map['category'],
      date: DateTime.parse(map['date']),
      amount: map['amount'],
      balance: map['balance'],
    );
  }
}
