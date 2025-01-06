import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tamerin/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> login(String email, String password) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final url = Uri.parse('https://reqres.in/api/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        print('Login successful: $token');
        // Redirect to the next page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        final errorData = json.decode(response.body);
        setState(() {
          _errorMessage = errorData['error'];
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred. Please try again later.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              "assets/logo.png",
              width: 300,
              height: 350,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Log In',
                  style: TextStyle(
                    color: Color(0xFF8E4FF4),
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                if (_errorMessage != null) ...[
                  Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
                SizedBox(height: 13),
                TextField(
                  controller: _emailController,
                  style: const TextStyle(
                    color: Color(0xFF393939),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color(0xFF837E93),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF837E93),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF8E4FF4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _passwordController,
                  style: const TextStyle(
                    color: Color(0xFF393939),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color(0xFF837E93),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF837E93),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF8E4FF4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                if (_isLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      width: 329,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();
                          if (email.isNotEmpty && password.isNotEmpty) {
                            login(email, password);
                          } else {
                            setState(() {
                              _errorMessage = 'Please fill in all fields';
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8E4FF4),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        color: Color(0xFF837E93),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 2.5,
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
