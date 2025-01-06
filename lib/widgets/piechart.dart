import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tamerin/models/transaction.dart';

class PieChartWidget extends StatelessWidget {
  final List<Transaction> transactions;

  const PieChartWidget({required this.transactions, Key? key})
      : super(key: key);

  String _formatAmount(int amount) {
    return amount.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (Match match) => '${match.group(1)}.',
        );
  }

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return Center(
        child: Text(
          'No transactions available',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    final categoryTotals = _calculateCategoryTotals(transactions);

    final brightColors = [
      Colors.amberAccent,
      Colors.lightBlueAccent,
      Colors.lightGreenAccent,
      Colors.orangeAccent,
      Colors.pinkAccent,
      Colors.yellowAccent,
      Colors.cyanAccent,
      Colors.deepOrangeAccent,
      Colors.limeAccent,
      Colors.tealAccent,
    ];
    final pieChartSections = categoryTotals.entries.map((entry) {
      final colorIndex = categoryTotals.keys.toList().indexOf(entry.key);
      return PieChartSectionData(
        color: brightColors[colorIndex % brightColors.length],
        value: entry.value.toDouble(),
        title: '${entry.key}\n Rp. ${_formatAmount(entry.value)}',
        titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        radius: 60,
      );
    }).toList();

    return PieChart(
      PieChartData(
        sections: pieChartSections,
        centerSpaceRadius: 40,
        borderData: FlBorderData(show: false),
        sectionsSpace: 4,
      ),
    );
  }

  /// Menghitung total transaksi berdasarkan kategori
  Map<String, int> _calculateCategoryTotals(List<Transaction> transactions) {
    Map<String, int> totals = {};
    for (var transaction in transactions) {
      if (totals.containsKey(transaction.category)) {
        totals[transaction.category] =
            totals[transaction.category]! + transaction.amount;
      } else {
        totals[transaction.category] = transaction.amount;
      }
    }
    return totals;
  }
}
