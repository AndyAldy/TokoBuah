class Sayur {
  String nama_sayur;
  int stok_sayur;

  Sayur(this.nama_sayur, this.stok_sayur);

  @override
 String toString(){
  return "Sayur: $nama_sayur, Stock: $stok_sayur";
  }
}
