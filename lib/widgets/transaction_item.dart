import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String type;
  final String name;
  final String category;
  final String date;
  final int amount;

  TransactionItem({
    required this.type,
    required this.name,
    required this.category,
    required this.amount,
    required this.date,
  });

  IconData _getIcon(String category) {
    switch (category) {
      case 'Food':
        return Icons.fastfood;
      case 'Top Up':
        return Icons.account_balance_wallet;
      case 'Freelance':
        return Icons.work_outline;
      case 'Shopping':
        return Icons.shopping_cart;
      case 'Active Income':
        return Icons.attach_money;
      case 'Passive Income':
        return Icons.savings;
      case 'Invest':
        return Icons.trending_up;
      case 'Others':
        return Icons.more_horiz;
      default:
        return Icons.help;
    }
  }

  String _formatAmount(int amount) {
    // Ubah angka menjadi string dengan pemisah ribuan
    return amount.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (Match match) => '${match.group(1)}.',
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(
          _getIcon(category),
          color: Color(0xFF8E4FF3),
        ),
      ),
      title: Text(name),
      subtitle: Text(category),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Rp. ${_formatAmount(amount)}",
            style: TextStyle(
              fontSize: 16,
              color: type == 'Income' ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            date,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
