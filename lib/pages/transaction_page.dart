import 'package:flutter/material.dart';
import 'package:tamerin/models/database_helper.dart';
import 'package:tamerin/models/transaction.dart' as model;
import 'package:tamerin/widgets/transaction_item.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool isIncomeSelected = true;

  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  Future<List<model.Transaction>> _fetchTransactions() async {
    final allTransactions = await dbHelper.readAllTransactions();
    return allTransactions
        .where((transaction) =>
            transaction.type == (isIncomeSelected ? 'Income' : 'Outcome'))
        .toList();
  }

  Future<void> _refreshData() async {
    setState(() {}); // Memaksa build ulang widget untuk memperbarui data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Transaction",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshData,
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian toggle Income dan Outcome
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Tombol Income
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isIncomeSelected = true;
                    });
                  },
                  child: Text(
                    "Income",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isIncomeSelected ? Colors.purple : Colors.black54,
                    ),
                  ),
                ),
                // Tombol Outcome
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isIncomeSelected = false;
                    });
                  },
                  child: Text(
                    "Outcome",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: !isIncomeSelected ? Colors.purple : Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, height: 0), // Garis pembatas

          // List transaksi berdasarkan jenis
          Expanded(
            child: FutureBuilder<List<model.Transaction>>(
              future: _fetchTransactions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No transactions found.'));
                }

                final transactions = snapshot.data!;

                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return TransactionItem(
                        type: transaction.type,
                        name: transaction.name,
                        category: transaction.category,
                        amount: transaction.amount,
                        date: transaction.date
                            .toLocal()
                            .toIso8601String()
                            .split('T')[0]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
