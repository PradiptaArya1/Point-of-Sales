import 'produk.dart';

class Keranjang {
  List<Map<String, dynamic>> items = [];

  // Menambahkan produk ke keranjang
  void tambahProduk(Produk produk, int jumlah) {
    if (produk.kurangiStok(jumlah)) {
      int totalHarga = produk.harga * jumlah; // Hitung total harga per produk
      items.add({
        'produk': produk,
        'jumlah': jumlah,
        'totalHarga': totalHarga, // Menyimpan total harga per produk
      });
      print(
          '${produk.nama} x$jumlah ditambahkan ke keranjang dengan total harga Rp$totalHarga.');
    } else {
      print('Stok ${produk.nama} tidak mencukupi.');
    }
  }

  // Menghapus produk dari keranjang berdasarkan nama
  void hapusProduk(String namaProduk) {
    items.removeWhere((item) => item['produk'].nama == namaProduk);
    print('$namaProduk telah dihapus dari keranjang.');
  }

  // Menampilkan keranjang belanja
  void tampilkanKeranjang() {
    if (items.isEmpty) {
      print('Keranjang kosong.');
    } else {
      print('Isi Keranjang:');
      for (var item in items) {
        // Memastikan item['produk'] benar-benar Produk
        if (item['produk'] is Produk) {
          var produk = item['produk'] as Produk;
          var jumlah = item['jumlah'] as int;
          var totalHarga =
              item['totalHarga'] as int; // Akses totalHarga dengan benar
          print('${produk.nama} x$jumlah = Rp$totalHarga');
        }
      }
    }
  }

  // Menghitung total harga keranjang
  int hitungTotal() {
    int total = 0;
    for (var item in items) {
      total +=
          item['totalHarga'] as int; // Menjumlahkan totalHarga untuk semua item
    }
    return total;
  }
}
