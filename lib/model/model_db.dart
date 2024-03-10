class Wisata {
  final int id;
  final String nama;
  final String biaya;
  final String popularitas;
  final String fasilitas;
  final String jenis;

  Wisata({
    required this.id,
    required this.nama,
    required this.biaya,
    required this.popularitas,
    required this.fasilitas,
    required this.jenis,
  });

  factory Wisata.fromMap(Map<String, dynamic> map) {
    return Wisata(
      id: map['id'],
      nama: map['nama'],
      biaya: map['biaya'],
      popularitas: map['popularitas'],
      fasilitas: map['fasilitas'],
      jenis: map['jenis'],
    );
  }
}

class Inputan {
  final String biaya;
  final String popularitas;
  final String fasilitas;
  final String jenis;

  Inputan({
    required this.biaya,
    required this.popularitas,
    required this.fasilitas,
    required this.jenis,
  });

  Map<String, dynamic> toMap() {
    return {
      'biaya': biaya,
      'popularitas': popularitas,
      'fasilitas': fasilitas,
      'jenis': jenis,
    };
  }
}
