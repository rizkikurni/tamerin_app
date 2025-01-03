import 'package:flutter/material.dart';

class Insight extends StatelessWidget {
  const Insight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF3E5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(Icons.lightbulb, color: Color(0xFF4A148C)),
          title: Text(
            "Let's check your Financial Insight for the month of June!",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
