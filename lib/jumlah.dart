import 'buah.dart';

class TokoBuah {
  Buah buah;
  int jumlah;

  TokoBuah(this.buah, this.jumlah);

  double hitungTotal() {
    return buah.harga * jumlah;
  }

  String kategoriHarga() {
    if (buah.harga > 50000) return "Mahal";
    if (buah.harga > 20000) return "Sedang";
    return "Murah";
  }
}
