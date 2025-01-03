import 'package:flutter/material.dart';
import 'package:tamerin/widgets/action_button.dart';

class Balance extends StatelessWidget {
  final int balance;

  Balance({
    required this.balance,
  });

  String _formatBalance(int balance) {
    // Ubah angka menjadi string dengan pemisah ribuan
    return balance.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (Match match) => '${match.group(1)}.',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Sudut melengkung
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 0.5), // Efek melayang
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "YOUR BALANCE",
              style: TextStyle(
                color: Color(0xFF828991),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Rp. ${_formatBalance(balance)}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton(
                  icon: Icons.arrow_downward,
                  label: "Income",
                ),
                ActionButton(
                  icon: Icons.arrow_upward,
                  label: "Outcome",
                ),
                ActionButton(
                  icon: Icons.newspaper,
                  label: "Blog",
                ),
                ActionButton(
                  icon: Icons.person,
                  label: "Profile",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
