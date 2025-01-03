// import 'package:flutter/material.dart';
// import 'package:tamerin/models/database_helper.dart';
// import 'package:tamerin/models/transaction.dart';

// import 'package:tamerin/widgets/bggradient.dart';
// import 'package:tamerin/widgets/header.dart';
// import 'package:tamerin/widgets/insight.dart';
// import 'package:tamerin/widgets/balance.dart';
// import 'package:tamerin/widgets/transaction_item.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Future<Map<String, dynamic>> _homeData;

//   @override
//   void initState() {
//     super.initState();
//     _homeData = _fetchHomeData();
//   }

//   Future<Map<String, dynamic>> _fetchHomeData() async {
//     final db = DatabaseHelper.instance;

//     // Fetch saldo terakhir
//     final lastBalance = await db.getBalance();

//     // Fetch 5 transaksi terakhir
//     final lastTransactions = await db.getLastTransactions(5);

//     return {
//       'balance': lastBalance,
//       'transactions': lastTransactions,
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home"),
//       ),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: _homeData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return const Center(child: Text("Error fetching data"));
//           } else if (snapshot.hasData) {
//             final data = snapshot.data!;
//             final balance = data['balance'] as int;
//             final transactions = data['transactions'] as List<Transaction>;

//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Balance Section
//                   Stack(children: [
//                     BgGradient(),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Header(),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Balance(
//                               balance: balance,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ]),

//                   // Financial Insight Section
//                   Insight(),
//                   // Recent Transactions
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Text(
//                       "Recent Transactions",
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: transactions.length,
//                       itemBuilder: (context, index) {
//                         final transaction = transactions[index];
//                         return TransactionItem(
//                             type: transaction.type,
//                             name: transaction.name,
//                             category: transaction.category,
//                             amount: transaction.amount,
//                             date: transaction.date
//                                 .toLocal()
//                                 .toIso8601String()
//                                 .split('T')[0]);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return const Center(child: Text("No data available"));
//           }
//         },
//       ),
//     );
//   }
// }
