class JelajahModel {
  final String jenisWisata;
  final String namaWisata;
  final String lokasiWisata;
  final String touristBox;
  final String deskripsi;

  JelajahModel(
      {required this.jenisWisata,
      required this.namaWisata,
      required this.lokasiWisata,
      required this.touristBox,
      required this.deskripsi});
}

List<JelajahModel> dataJelajah = [
  JelajahModel(
      jenisWisata: "Wisata Buatan",
      namaWisata: "Cacaban",
      lokasiWisata: "Kedungbanteng",
      touristBox: "assets/images/potrait/cacaban.jpg",
      deskripsi: "Tidak ada deskripsi"),
  JelajahModel(
      jenisWisata: "Wisata Alam",
      namaWisata: "Pemandian Guci",
      lokasiWisata: "Bojong",
      touristBox: "assets/images/potrait/guci.jpg",
      deskripsi: "Tidak ada deskripsi"),
  JelajahModel(
      jenisWisata: "Wisata Pantai",
      namaWisata: "Pantai Purwahamba Indah",
      lokasiWisata: "Suradadi",
      touristBox: "assets/images/potrait/purin.jpg",
      deskripsi: "Tidak ada deskripsi"),
  JelajahModel(
      jenisWisata: "Wisata Alam",
      namaWisata: "Guci Forest",
      lokasiWisata: "Bojong",
      touristBox: "assets/images/potrait/guci_forest.jpg",
      deskripsi:
          "Wisata Baru di Guci dengan konsep klasik estetik. Menyediakan sarana rekreasi dan istirahat yang menenangkan dan menginspirasi. Dengan nuansa pemandangan alam terbuka berupa hutan pinus yang original dan asri membuat setiap wisatawan akan betah berlama-lama menikmati seluruh fasilitas yang ada. Guci Forest menyediakan Villa dengan ornamen kayu bergaya klasik, dilengkapi dengan Kolam renang air panas. Villa Utama Guci Forest terdiri dari 9 Kamar dengan fasilitas yang tersedia di antaranya : Kolam renang air panas, Musholla, Cafe dan resto. Kecuali villa utama, ada juga villa-villa kecil ( 1 kamar dan 2 kamar). Di sekitar villa tersedia sarana Camping dan Campervan, Meeting, Outbound, Offroad, rivertoobing, menyediakan Ketring buat Group"),
  JelajahModel(
      jenisWisata: "Wisata Buatan",
      namaWisata: "Hot Waterbom Guciku",
      lokasiWisata: "Bumijawa",
      touristBox: "assets/images/potrait/guciku.jpg",
      deskripsi: "Tidak ada deskripsi"),
  JelajahModel(
      jenisWisata: "Wisata Buatan",
      namaWisata: "Danau Beko",
      lokasiWisata: "Margasari",
      touristBox: "assets/images/potrait/beko.jpg",
      deskripsi: "Tidak ada deskripsi"),
  JelajahModel(
      jenisWisata: "Wisata Alam",
      namaWisata: "Prabalintang",
      lokasiWisata: "Bojong",
      touristBox: "assets/images/potrait/prabalintang.jpg",
      deskripsi: "Tidak ada deskripsi"),
  JelajahModel(
      jenisWisata: "Wisata Sejarah",
      namaWisata: "Museum Semedo",
      lokasiWisata: "Kedungbanteng",
      touristBox: "assets/images/potrait/semedo.jpg",
      deskripsi: "Tidak ada deskripsi"),
  JelajahModel(
      jenisWisata: "Wisata Alam",
      namaWisata: "Curug Cantel",
      lokasiWisata: "Bumijawa",
      touristBox: "assets/images/potrait/curug_cantel.jpg",
      deskripsi: "Tidak ada deskripsi"),
];
