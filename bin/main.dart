import 'dart:io';
import '../lib/produk.dart';
import '../lib/keranjang.dart';
import '../lib/transaksi.dart';
import '../lib/kasir.dart';

void main() {
  var produk1 = Produk('Fanta', 50000, 10);
  var produk2 = Produk('Sprite', 5000, 50);
  var produk3 = Produk('Coca-cola', 7000, 20);
  var produk4 = Produk('Mizone', 10000, 15);

  var daftarProduk = [produk1, produk2, produk3, produk4];

  var keranjang = Keranjang();

  var kasir = Kasir('Arya');

  while (true) {
    print('\n=== Sistem POS Sederhana ===');
    print('1. Lihat Produk');
    print('2. Tambah Produk ke Keranjang');
    print('3. Hapus Produk dari Keranjang');
    print('4. Lihat Keranjang');
    print('5. Checkout');
    print('6. Laporan Penjualan');
    print('0. Keluar');
    stdout.write('Pilih menu: ');
    var pilihan = stdin.readLineSync();

    if (pilihan == '1') {
      print('\nDaftar Produk:');
      if (daftarProduk.isEmpty) {
        print('Tidak ada produk yang tersedia.');
      } else {
        for (var i = 0; i < daftarProduk.length; i++) {
          var produk = daftarProduk[i];
          print(
              '${i + 1}. ${produk.nama} - Rp${produk.harga} (Stok: ${produk.stok})');
        }
      }
    } else if (pilihan == '2') {
      print('\nMasukkan nomor produk yang ingin dibeli:');
      for (var i = 0; i < daftarProduk.length; i++) {
        var produk = daftarProduk[i];
        print(
            '${i + 1}. ${produk.nama} - Rp${produk.harga} (Stok: ${produk.stok})');
      }
      stdout.write('Nomor produk: ');
      var nomorProduk = int.tryParse(stdin.readLineSync() ?? '');
      if (nomorProduk == null ||
          nomorProduk < 1 ||
          nomorProduk > daftarProduk.length) {
        print('Nomor produk tidak valid.');
        continue;
      }

      var produkDipilih = daftarProduk[nomorProduk - 1];
      stdout.write('Jumlah: ');
      var jumlah = int.tryParse(stdin.readLineSync() ?? '');
      if (jumlah == null || jumlah <= 0) {
        print('Jumlah tidak valid.');
        continue;
      }

      if (jumlah > produkDipilih.stok) {
        print('Stok tidak mencukupi. Stok tersedia: ${produkDipilih.stok}');
        continue;
      }

      keranjang.tambahProduk(produkDipilih, jumlah);
    } else if (pilihan == '3') {
      print('\nMasukkan nama produk yang ingin dihapus:');
      keranjang.tampilkanKeranjang();
      stdout.write('Nama produk: ');
      var namaProduk = stdin.readLineSync();
      if (namaProduk != null && namaProduk.isNotEmpty) {
        keranjang.hapusProduk(namaProduk);
      } else {
        print('Nama produk tidak valid.');
      }
    } else if (pilihan == '4') {
      if (keranjang.items.isEmpty) {
        print('Keranjang Anda kosong.');
      } else {
        keranjang.tampilkanKeranjang();
      }
    } else if (pilihan == '5') {
      if (keranjang.items.isEmpty) {
        print('Keranjang kosong, tidak bisa checkout.');
        continue;
      }
      var totalBelanja = keranjang.hitungTotal();
      var transaksi = Transaksi(DateTime.now(), keranjang.items, totalBelanja);
      transaksi.cetakStruk();
      kasir.tambahTransaksi(transaksi);
      keranjang = Keranjang();
    } else if (pilihan == '6') {
      if (kasir.transaksiList.isEmpty) {
        print('Tidak ada transaksi yang tercatat.');
      } else {
        kasir.laporanPenjualan();
      }
    } else if (pilihan == '0') {
      print('Terima kasih telah menggunakan sistem POS.');
      break;
    } else {
      print('Pilihan tidak valid.');
    }
  }
}
