import 'package:flutter/material.dart';
import 'package:tamerin/models/database_helper.dart';
import 'package:tamerin/models/transaction.dart';
import 'package:tamerin/pages/update_page.dart'; // Ganti dengan halaman update Anda

class TransactionItem extends StatelessWidget {
  final int? id;
  final String type;
  final String name;
  final String category;
  final String date;
  final int amount;

  TransactionItem({
    required this.id,
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
    return amount.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (Match match) => '${match.group(1)}.',
        );
  }

  Future<void> _deleteTransaction(BuildContext context) async {
    final dbHelper = DatabaseHelper.instance;
    if (id != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transaction deleted successfully!')),
      );
      await dbHelper.deleteTransaction(id!);
    }
  }

  void _navigateToUpdateScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdatePage(
          transaction: Transaction(
            id: id,
            type: type,
            name: name,
            category: category,
            date: DateTime.parse(date),
            amount: amount,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xFF8E4FF3),
        child: Icon(
          _getIcon(category),
          color: Colors.white,
        ),
      ),
      title: Text(name),
      subtitle: Text(category),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
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
          InkWell(
            onTap: () => _showOptions(context),
            child: Icon(Icons.more_vert, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  void _showOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text("Options"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blue),
                title: Text('Update'),
                onTap: () {
                  Navigator.pop(context);
                  _navigateToUpdateScreen(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text('Delete'),
                onTap: () async {
                  Navigator.pop(context);
                  await _deleteTransaction(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
