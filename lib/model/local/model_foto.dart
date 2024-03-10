class FotoModel {
  final String jenisWisata;
  final String namaWisata;
  final String fotoBox;
  final String lokasiWisata;

  FotoModel(
      {required this.jenisWisata,
      required this.namaWisata,
      required this.fotoBox,
      required this.lokasiWisata});
}

List<FotoModel> dataModel = [
  FotoModel(
    jenisWisata: "Wisata Buatan",
    namaWisata: "Cacaban",
    fotoBox: "assets/images/cacaban.jpg",
    lokasiWisata: "Kedungbanteng",
  ),
  FotoModel(
    jenisWisata: "Wisata Alam",
    namaWisata: "Pemandian Guci",
    fotoBox: "assets/images/guci.jpg",
    lokasiWisata: "Bojong",
  ),
  FotoModel(
    jenisWisata: "Wisata Pantai",
    namaWisata: "Pantai Purwahamba Indah",
    fotoBox: "assets/images/pai.png",
    lokasiWisata: "Suradadi",
  ),
  FotoModel(
    jenisWisata: "Wisata Alam",
    namaWisata: "Guci Forest",
    fotoBox: "assets/images/guci_forest.jpg",
    lokasiWisata: "Bojong",
  ),
  FotoModel(
    jenisWisata: "Wisata Buatan",
    namaWisata: "Hot Waterbom Guciku",
    fotoBox: "assets/images/guciku.jpg",
    lokasiWisata: "Bumijawa",
  ),
  FotoModel(
    jenisWisata: "Wisata Buatan",
    namaWisata: "Danau Beko",
    fotoBox: "assets/images/beko.jpg",
    lokasiWisata: "Margasari",
  ),
  FotoModel(
    jenisWisata: "Wisata Alam",
    namaWisata: "Prabalintang",
    fotoBox: "assets/images/prabalintang.png",
    lokasiWisata: "Bojong",
  ),
  FotoModel(
    jenisWisata: "Wisata Sejarah",
    namaWisata: "Museum Semedo",
    fotoBox: "assets/images/semedo.jpg",
    lokasiWisata: "Kedungbanteng",
  ),
  FotoModel(
    jenisWisata: "Wisata Alam",
    namaWisata: "Curug Cantel",
    fotoBox: "assets/images/curug_cantel.jpg",
    lokasiWisata: "Bumijawa",
  ),
];
