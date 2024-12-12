import 'package:flutter/material.dart';

class TransaksiScreen extends StatelessWidget {
  const TransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi'),
        automaticallyImplyLeading: false, // Menghilangkan tombol back
      ),
      body: Center(
        child: const Text(
          'Ini adalah halaman Transaksi',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
