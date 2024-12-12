class Buah {
  String nama_buah;
  double harga;
  int stok;

  Buah(this.nama_buah, this.harga, this.stok);

  @override
  String toString() {
    return "Buah: $nama_buah, Harga: $harga, Stock: $stok";
  }
}
