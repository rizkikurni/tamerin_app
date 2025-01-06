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
          color: Color(0xFFEFE8F8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(Icons.lightbulb, color: Color(0xFF8E4FF4)),
          title: Text(
            "Let's check your Financial Insight for the month of June!",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
