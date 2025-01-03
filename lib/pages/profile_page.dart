import 'package:flutter/material.dart';
import 'package:tamerin/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[200],
              backgroundImage: const AssetImage('assets/avatar.png'),
            ),
            const SizedBox(height: 16),

            // User Name
            const Text(
              "Muhammad Rizki Kurniawan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // User Email
            const Text(
              "muhammadrizki@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // Logout Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                "Logout",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 32),

            // Additional Options (e.g., About App)
            ListTile(
              onTap: () {
                // Navigate to About App page
              },
              leading: const Icon(Icons.info_outline, color: Colors.black),
              title: const Text("About App"),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.black),
            ),
            const Divider(),

            ListTile(
              onTap: () {
                // Navigate to Support or Help page
              },
              leading: const Icon(Icons.help_outline, color: Colors.black),
              title: const Text("Help & Support"),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
