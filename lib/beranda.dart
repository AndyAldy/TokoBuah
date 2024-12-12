import 'package:flutter/material.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  int selectedindex = 0;

  // Daftar produk
  final List<Map<String, dynamic>> produk = [
    {
      "nama": "Apel",
      "harga": 10000,
      "deskripsi": "Apel segar dan manis.",
      "image": 'assets/image/apel.jpg',
    },
    {
      "nama": "Pisang",
      "harga": 15000,
      "deskripsi": "Pisang lokal berkualitas."
    },
    {
      "nama": "Jeruk",
      "harga": 12000,
      "deskripsi": "Jeruk segar penuh vitamin C."
    },
    {"nama": "Mangga", "harga": 20000, "deskripsi": "Mangga manis dan lezat."},
    {"nama": "Anggur", "harga": 25000, "deskripsi": "Anggur merah tanpa biji."},
    {
      "nama": "Semangka",
      "harga": 30000,
      "deskripsi": "Semangka segar dari petani."
    },
  ];

  // Keranjang belanja
  final List<Map<String, dynamic>> keranjang = [];

  // Fungsi ketika bottom navigation item dipilih
  void _onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });

    if (index == 2) {
      // Navigasi ke halaman Tentang Saya jika tab Profil dipilih
      Navigator.pushNamed(context, '/tentangsayascreen');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Navigasi ke: ${_getPageTitle(index)}")),
      );
    }
  }

  // Judul halaman berdasarkan index
  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'Beranda';
      case 1:
        return 'Transaksi';
      case 2:
        return 'Profil';
      default:
        return '';
    }
  }

  // Fungsi menampilkan dialog detail produk
  void _showProductDetail(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item["nama"]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Harga: Rp. ${item["harga"]}"),
              SizedBox(height: 8),
              Text(item["deskripsi"]),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  keranjang.add(item);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text("${item["nama"]} ditambahkan ke keranjang!")),
                );
              },
              child: Text("Tambah ke Keranjang"),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/co'),
              child: const Text('Beli Langsung',
                  style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Tombol kembali ditekan")),
            );
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Cari produk...',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.message, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Tombol pesan ditekan")),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text("Keranjang dibuka (${keranjang.length} item)")),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Jumlah kolom per baris
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7, // Rasio tinggi-lebar item
          ),
          itemCount: produk.length,
          itemBuilder: (context, index) {
            final item = produk[index]; // Data produk per item
            return GestureDetector(
              onTap: () => _showProductDetail(context, item),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item["image"] ?? '-'),
                    Text(item["nama"], style: TextStyle(fontSize: 16)),
                    SizedBox(height: 4),
                    Text(
                      "Rp. ${item["harga"]}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
