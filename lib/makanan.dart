class Makanan {
  final String nama;
  final String deskripsi;
  final String gambar;
  final String detail;
  final String waktubuka;
  final String harga;
  final String kalori;
  final List<String> gambarlain;
  final List<Map<String, String>> bahan;

  Makanan(
      {required this.nama,
      required this.harga,
      required this.gambarlain,
      required this.waktubuka,
      required this.detail,
      required this.kalori,
      required this.bahan,
      required this.deskripsi,
      required this.gambar});

  factory Makanan.fromJson(Map<String, dynamic> json) {
    return Makanan(
      nama: json["nama"],
      deskripsi: json["deskripsi"],
      detail: json["detail"],
      waktubuka: json["waktubuka"],
      harga: json["harga"],
      kalori: json["kalori"],
      gambar: json["gambar"],
      gambarlain: List<String>.from(json["gambarlain"]),
      bahan: List<Map<String, String>>.from(json["bahan"].map(
          (x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
    );
  }
}
