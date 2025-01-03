import 'package:flutter/material.dart';
import 'package:tamerin/models/database_helper.dart';
import 'package:tamerin/models/transaction.dart' as model;

import 'package:tamerin/widgets/bggradient.dart';
import 'package:tamerin/widgets/header.dart';
import 'package:tamerin/widgets/insight.dart';
import 'package:tamerin/widgets/balance.dart';
import 'package:tamerin/widgets/transaction_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  Future<Map<String, dynamic>> _fetchTransactions() async {
    try {
      final lastBalance = await dbHelper.getBalance();
      final lastTransactions = await dbHelper.getLastTransactions(5);
      return {
        'balance': lastBalance,
        'transactions': lastTransactions,
      };
    } catch (e) {
      throw Exception('Error fetching transactions: $e');
    }
  }

  late Future<Map<String, dynamic>> _transactionData;

  @override
  void initState() {
    super.initState();
    _transactionData = _fetchTransactions();
  }

  void _refreshData() {
    setState(() {
      _transactionData = _fetchTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _transactionData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            final balance = data['balance'] as int;
            final transactions =
                data['transactions'] as List<model.Transaction>;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Balance Section
                  Stack(
                    children: [
                      const BgGradient(),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              const Header(),
                              const SizedBox(height: 20),
                              Balance(balance: balance),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Financial Insight Section
                  const Insight(),
                  // Recent Transactions
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Transactions",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: _refreshData,
                        ),
                      ],
                    ),
                  ),
                  transactions.isEmpty
                      ? Container(
                          height: 300,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Text(
                                "Data Not Found",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: transactions.map((transaction) {
                              return TransactionItem(
                                type: transaction.type,
                                name: transaction.name,
                                category: transaction.category,
                                amount: transaction.amount,
                                date: transaction.date
                                    .toLocal()
                                    .toIso8601String()
                                    .split('T')[0],
                              );
                            }).toList(),
                          ),
                        ),
                ],
              ),
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
