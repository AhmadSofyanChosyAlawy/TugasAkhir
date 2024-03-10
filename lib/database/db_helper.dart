import 'dart:math';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:xkate_app/model/model_db.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    await tambahBasisKasus();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'wisata.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE wisata(id INTEGER PRIMARY KEY, nama TEXT, biaya_min INTEGER, biaya_max INTEGER,  popularitas INTEGER, fasilitas INTEGER, jenis INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> tambahBasisKasus() async {
    final db = await database;
    await db.insert('wisata', {
      'nama': 'Cacaban',
      'biaya_min': 0,
      'biaya_max': 10000,
      'popularitas': 4,
      'fasilitas': 4,
      'jenis': 3, //'Wisata Buatan'
    });
    await db.insert('wisata', {
      'nama': 'Pemandian Guci',
      'biaya_min': 51000,
      'biaya_max': 100000,
      'popularitas': 5,
      'fasilitas': 5,
      'jenis': 4, //'Wisata Alam'
    });
    await db.insert('wisata', {
      'nama': 'Pantai Purwahamba Indah',
      'biaya_min': 11000,
      'biaya_max': 25000,
      'popularitas': 4,
      'fasilitas': 4,
      'jenis': 2, //'Wisata Pantai'
    });
    // await db.insert('wisata', {
    //   'nama': 'Guci Forest',
    //   'biaya': 'Rp. 26000 - Rp. 50000',
    //   'popularitas': 'Bintang 5',
    //   'fasilitas': 'Bintang 5',
    //   'jenis': 'Wisata Alam'
    // });
    // await db.insert('wisata', {
    //   'nama': 'Hot Waterboom Guciku',
    //   'biaya': 'Rp. 26000 - Rp. 50000',
    //   'popularitas': 'Bintang 5',
    //   'fasilitas': 'Bintang 5',
    //   'jenis': 'Wisata Buatan'
    // });
    // await db.insert('wisata', {
    //   'nama': 'Danau Beko',
    //   'biaya': 'Rp. 0 - Rp. 10000',
    //   'popularitas': 'Bintang 3',
    //   'fasilitas': 'Bintang 3',
    //   'jenis': 'Wisata Alam'
    // });
    // await db.insert('wisata', {
    //   'nama': 'Prabalintang',
    //   'biaya': 'Rp. 11000 - Rp. 25000',
    //   'popularitas': 'Bintang 3',
    //   'fasilitas': 'Bintang 3',
    //   'jenis': 'Wisata Alam'
    // });
    // await db.insert('wisata', {
    //   'nama': 'Museum Semedo',
    //   'biaya': 'Rp. 0 - Rp. 10000',
    //   'popularitas': 'Bintang 3',
    //   'fasilitas': 'Bintang 4',
    //   'jenis': 'Wisata Sejarah'
    // });
    // await db.insert('wisata', {
    //   'nama': 'Curug Cantel',
    //   'biaya': 'Rp. 11000 - Rp. 25000',
    //   'popularitas': 'Bintang 3',
    //   'fasilitas': 'Bintang 3',
    //   'jenis': 'Wisata Alam'
    // });
  }

  Future<List<Wisata>> ambilSemuaWisata() async {
    final db = await database;
    final results = await db.query('wisata');
    return results.map((e) => Wisata.fromMap(e)).toList();
  }

  Future<Map<Wisata, double>> cariRekomendasi(Inputan inputan) async {
    final db = await database;
    final results = await db.query('wisata');
    final wisata = results.map((e) => Wisata.fromMap(e)).toList();

    double jarakMax = double.negativeInfinity;
    double jarakMin = double.infinity;
    Map<Wisata, double> hasilKemiripan = {};

    for (Wisata kasus in wisata) {
      double jarak = hitungJarak(kasus, inputan);
      hasilKemiripan[kasus] = jarak;

      if (jarak > jarakMax) {
        jarakMax = jarak;
      }
      if (jarak < jarakMin) {
        jarakMin = jarak;
      }
    }

    Map<Wisata, double> persentaseKesamaan = {};
    hasilKemiripan.forEach((kasus, jarak) {
      double persentase = hitungPersentaseKesamaan(jarak, jarakMax, jarakMin);
      persentaseKesamaan[kasus] = persentase;
    });

    return persentaseKesamaan;
  }

  double hitungJarak(Wisata wisata, Inputan inputan) {
    int biayaMin = (inputan.biayaMin) - wisata.biayaMin.abs();
    int biayaMax = (inputan.biayaMax) - wisata.biayaMax.abs();
    int popularitas = (inputan.popularitas) - wisata.popularitas.abs();
    int fasilitas = (inputan.fasilitas) - wisata.fasilitas.abs();
    int jenis = (inputan.jenis) - wisata.jenis.abs();
    return sqrt(
      pow(biayaMin, 2) +
          pow(biayaMax, 2) +
          pow(popularitas, 2) +
          pow(fasilitas, 2) +
          pow(jenis, 2),
    );
  }

  double hitungPersentaseKesamaan(
      double jarak, double jarakMax, double jarakMin) {
    double jarakNormal = (jarak - jarakMin) / (jarakMax - jarakMin);
    double persentaseKesamaan = 1 - jarakNormal;
    return persentaseKesamaan;
  }
}
