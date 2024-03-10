class Wisata {
  final int id;
  final String nama;
  final int biayaMin;
  final int biayaMax;
  final int popularitas;
  final int fasilitas;
  final int jenis;

  Wisata({
    required this.id,
    required this.nama,
    required this.biayaMin,
    required this.biayaMax,
    required this.popularitas,
    required this.fasilitas,
    required this.jenis,
  });

  factory Wisata.fromMap(Map<String, dynamic> map) {
    return Wisata(
      id: map['id'],
      nama: map['nama'],
      biayaMin: map['biaya_min'],
      biayaMax: map['biaya_max'],
      popularitas: map['popularitas'],
      fasilitas: map['fasilitas'],
      jenis: map['jenis'],
    );
  }
}

class Inputan {
  final int biayaMin;
  final int biayaMax;
  final int popularitas;
  final int fasilitas;
  final int jenis;

  Inputan({
    required this.biayaMin,
    required this.biayaMax,
    required this.popularitas,
    required this.fasilitas,
    required this.jenis,
  });

  Map<String, dynamic> toMap() {
    return {
      'biaya_min': biayaMin,
      'biaya_max': biayaMax,
      'popularitas': popularitas,
      'fasilitas': fasilitas,
      'jenis': jenis,
    };
  }
}
