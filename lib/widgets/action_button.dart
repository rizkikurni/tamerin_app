import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xFF8E4FF4),
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
