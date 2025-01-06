import 'package:flutter/material.dart';
import 'package:tamerin/pages/login_page.dart';

void main() {
  runApp(const Tamerin());
}

class Tamerin extends StatelessWidget {
  const Tamerin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 16),
          bodySmall: TextStyle(fontSize: 14),
        ),
      ),
      home: LoginPage(),
    );
  }
}
