import 'package:flutter/material.dart';

class BgGradient extends StatelessWidget {
  const BgGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF000428), // Warna awal
            Color(0xFF004e92), // Warna akhir
          ],
          begin: Alignment.topLeft, // Titik awal gradasi
          end: Alignment.bottomRight, // Titik akhir gradasi
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
