class Balance {
  final int total;

  Balance({required this.total});

  Map<String, dynamic> toMap() {
    return {
      'total': total,
    };
  }

  factory Balance.fromMap(Map<String, dynamic> map) {
    return Balance(total: map['total']);
  }
}
