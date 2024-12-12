import 'package:TokoBuahSayurApp/beranda.dart';
import 'package:TokoBuahSayurApp/co.dart';
import 'package:flutter/material.dart';
import '../lib/login.dart';
import '../lib/register.dart';
import '../lib/buah.dart';
import '../lib/jumlah.dart';
import '../lib/tentangsayascreen.dart';

void main() {
    runApp(const TokoBuahSayurApp());

    // Debugging: memastikan logika bekerja
    var apel = Buah("Apel", 30000, 3);
    var tokoApel = TokoBuah(apel, 3);

    print("Nama Buah: ${apel.nama_buah}");
    print("Harga Per Buah: Rp ${apel.harga}");
    print("Jumlah: ${apel.stok}");
    print("Total Harga: Rp ${tokoApel.hitungTotal()}");
    print("Kategori Harga: ${tokoApel.kategoriHarga()}");

}

class TokoBuahSayurApp extends StatelessWidget {
  const TokoBuahSayurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      initialRoute: '/',
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/beranda': (context) => const BerandaPage(),
        '/co': (context) => const CheckoutScreen(),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:325297162.
        '/tentangsayascreen': (context) => const TentangSayaScreen(),
      },
    );
  }
}
