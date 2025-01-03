import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Avatar bulat
        Row(
          children: [
            CircleAvatar(
              radius: 20, // Ukuran lingkaran avatar
              backgroundImage: AssetImage('assets/avatar.png'), // Gambar avatar
              backgroundColor:
                  Colors.grey, // Warna background jika gambar tidak tersedia
            ),
            SizedBox(width: 10), // Jarak antara avatar dan teks
            // Kolom untuk teks
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Rizki!",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        // Icon(Icons.notifications, color: Colors.white)
      ],
    );
  }
}
