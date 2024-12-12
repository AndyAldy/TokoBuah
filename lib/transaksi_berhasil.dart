import 'package:flutter/material.dart';

class PembayaranBerhasilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi Pembayaran'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implementasi navigasi kembali
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/success_icon.png'), // Ganti dengan path gambar Anda
            Text(
              'Selamat, Pembayaranmu Berhasil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Pesanan akan segera diteruskan ke penjual.'),
            Text('Silahkan cek status pesananmu di Daftar Transaksi'),
            SizedBox(height: 20),
            Text('Qris'),
            Text('Rp. xxx'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementasi navigasi ke halaman daftar transaksi
                // Navigator.pushNamed(context, '/daftarTransaksi');
              },
              child: Text('Lihat Daftar Transaksi'),
            ),
          ],
        ),
      ),
    );
  }
}