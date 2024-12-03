// ignore_for_file: unused_import

import 'keranjang.dart';

class Transaksi {
  DateTime tanggal;
  List<Map<String, dynamic>> items;
  int total;

  Transaksi(this.tanggal, this.items, this.total);

  // Method untuk mencetak struk
  void cetakStruk() {
    print('\n=== Struk Belanja ===');
    print('Tanggal: ${tanggal}');
    for (var item in items) {
      var produk = item['produk'];
      print('${produk.nama} x${item['jumlah']} = Rp${item['totalHarga']}');
    }
    print('Total Belanja: Rp$total');
    print('=====================');
  }
}
