import 'package:flutter/material.dart';
import 'package:xkate_app/database/db_helper.dart';
import 'package:xkate_app/model/model_db.dart';
import 'package:xkate_app/widgets/hasil_rekomendasi.dart';

class CariRekomendasi extends StatelessWidget {
  final dbHelper = DatabaseHelper();
  // final biayaController = TextEditingController();
  // final popularitasController = TextEditingController();
  // final fasilitasController = TextEditingController();
  List<int> biayaVal = [0, 10000];
  int fasilitasVal = 1;
  int popularitasVal = 1;
  final jenisController = TextEditingController();

  CariRekomendasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cari Rekomendasi Wisata')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Inputan Pengguna:'),
            DropdownButtonFormField<List<int>>(
              value: const [0, 10000],
              hint: const Text('Rp. 0 - Rp. 10000'),
              onChanged: (value) {
                biayaVal = value ?? [];
                // biayaController.text = value!.split(' - ')[0];
              },
              items: const [
                DropdownMenuItem(
                    value: [0, 10000], child: Text('Rp. 0 - Rp. 10000')),
                DropdownMenuItem(
                    value: [11000, 25000],
                    child: Text('Rp. 11000 - Rp. 25000')),
                DropdownMenuItem(
                    value: [26000, 50000],
                    child: Text('Rp. 26000 - Rp. 50000')),
                DropdownMenuItem(
                    value: [51000, 100000],
                    child: Text('Rp. 51000 - Rp. 100000')),
                DropdownMenuItem(
                    value: [100000, 1000000], child: Text('Diatas Rp. 100000'))
              ],
              decoration: const InputDecoration(labelText: 'Biaya'),
            ),
            DropdownButtonFormField<int>(
              value: 1,
              onChanged: (value) {
                popularitasVal = value ?? 0;
              },
              items: const [
                DropdownMenuItem(value: 1, child: Text('Bintang 1')),
                DropdownMenuItem(value: 2, child: Text('Bintang 2')),
                DropdownMenuItem(value: 3, child: Text('Bintang 3')),
                DropdownMenuItem(value: 4, child: Text('Bintang 4')),
                DropdownMenuItem(value: 5, child: Text('Bintang 5'))
              ],
              decoration: const InputDecoration(labelText: 'Popularitas'),
            ),
            DropdownButtonFormField<int>(
              value: 1,
              hint: const Text("Bintang 1"),
              onChanged: (value) {
                fasilitasVal = value ?? 0;
              },
              items: const [
                DropdownMenuItem(value: 1, child: Text('Bintang 1')),
                DropdownMenuItem(value: 2, child: Text('Bintang 2')),
                DropdownMenuItem(value: 3, child: Text('Bintang 3')),
                DropdownMenuItem(value: 4, child: Text('Bintang 4')),
                DropdownMenuItem(value: 5, child: Text('Bintang 5'))
              ],
              decoration: const InputDecoration(labelText: 'Fasilitas'),
            ),
            DropdownButtonFormField<String>(
              value: 'Wisata Alam',
              onChanged: (value) {
                jenisController.text = value!;
              },
              items: const [
                DropdownMenuItem(
                    value: 'Wisata Alam', child: Text('Wisata Alam')),
                DropdownMenuItem(
                    value: 'Wisata Buatan', child: Text('Wisata Buatan')),
                DropdownMenuItem(
                    value: 'Wisata Pantai', child: Text('Wisata Pantai')),
                DropdownMenuItem(
                    value: 'Wisata Sejarah', child: Text('Wisata Sejarah')),
              ],
              decoration: const InputDecoration(labelText: 'Jenis Wisata'),
            ),
            ElevatedButton(
              onPressed: () async {
                Inputan inputan = Inputan(
                  // biaya: biayaController.text,
                  // popularitas: popularitasController.text,
                  // fasilitas: fasilitasController.text,
                  biayaMin: biayaVal[0],
                  biayaMax: biayaVal[1],
                  popularitas: popularitasVal,
                  fasilitas: fasilitasVal,
                  jenis: jenisController.text,
                );
                showDialog(
                  context: context,
                  builder: (context) => HasilRekomendasiDialog(
                    inputan: inputan,
                  ),
                );
              },
              child: const Text('Cari'),
            ),
          ],
        ),
      ),
    );
  }
}
