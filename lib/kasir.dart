import 'transaksi.dart';

class Kasir {
  String nama;
  List<Transaksi> transaksiList = [];

  Kasir(this.nama);

  // Menambahkan transaksi ke dalam daftar transaksi
  void tambahTransaksi(Transaksi transaksi) {
    transaksiList.add(transaksi);
    print('Transaksi berhasil disimpan.');
  }

  // Menampilkan laporan penjualan
  void laporanPenjualan() {
    if (transaksiList.isEmpty) {
      print('Tidak ada transaksi yang tercatat.');
    } else {
      print('\n=== Laporan Penjualan ===');
      for (var transaksi in transaksiList) {
        print('Tanggal: ${transaksi.tanggal}');
        print('Total Penjualan: Rp${transaksi.total}');
      }
      print('==========================');
    }
  }
}
