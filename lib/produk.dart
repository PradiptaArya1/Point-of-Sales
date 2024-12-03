class Produk {
  String nama;
  int harga;
  int stok;

  Produk(this.nama, this.harga, this.stok);

  bool kurangiStok(int jumlah) {
    if (jumlah <= stok) {
      stok -= jumlah;
      return true;
    } else {
      return false;
    }
  }
}
