import 'package:flutter/material.dart';
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1747176020.
import 'package:TokoBuahSayurApp/register.dart';

// ignore: camel_case_types'
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selamat Datang, di Fresh Market!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/register'),
                    child: const Text('Daftar', style: TextStyle(color: Colors.blue)),
                  ),
                  GestureDetector(
                    onTap: () {}, // Implement password reset functionality if needed
                    child: const Text('Lupa sandi?', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/beranda'),
                    child: const Text('Login', style: TextStyle(color: Colors.blue)),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
