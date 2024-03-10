import 'package:flutter/material.dart';
import 'package:xkate_app/database/db_helper.dart';
import 'package:xkate_app/model/model_db.dart';
import 'package:xkate_app/widgets/hasil_rekomendasi.dart';

class CariRekomendasi extends StatelessWidget {
  final dbHelper = DatabaseHelper();
  final biayaController = TextEditingController();
  final popularitasController = TextEditingController();
  final fasilitasController = TextEditingController();
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
            DropdownButtonFormField<String>(
              value: 'Rp. 0 - Rp. 10000',
              onChanged: (value) {
                biayaController.text = value!.split(' - ')[0];
              },
              items: const [
                DropdownMenuItem(
                    value: 'Rp. 0 - Rp. 10000',
                    child: Text('Rp. 0 - Rp. 10000')),
                DropdownMenuItem(
                    value: 'Rp. 11000 - Rp. 25000',
                    child: Text('Rp. 11000 - Rp. 25000')),
                DropdownMenuItem(
                    value: 'Rp. 26000 - Rp. 50000',
                    child: Text('Rp. 26000 - Rp. 50000')),
                DropdownMenuItem(
                    value: 'Rp. 51000 - Rp. 100000',
                    child: Text('Rp. 51000 - Rp. 100000')),
                DropdownMenuItem(
                    value: 'Diatas Rp. 100000',
                    child: Text('Diatas Rp. 100000'))
              ],
              decoration: const InputDecoration(labelText: 'Biaya'),
            ),
            DropdownButtonFormField<String>(
              value: 'Bintang 1',
              onChanged: (value) {
                popularitasController.text = value!;
              },
              items: const [
                DropdownMenuItem(value: 'Bintang 1', child: Text('Bintang 1')),
                DropdownMenuItem(value: 'Bintang 2', child: Text('Bintang 2')),
                DropdownMenuItem(value: 'Bintang 3', child: Text('Bintang 3')),
                DropdownMenuItem(value: 'Bintang 4', child: Text('Bintang 4')),
                DropdownMenuItem(value: 'Bintang 5', child: Text('Bintang 5'))
              ],
              decoration: const InputDecoration(labelText: 'Popularitas'),
            ),
            DropdownButtonFormField<String>(
              value: 'Bintang 1',
              onChanged: (value) {
                fasilitasController.text = value!;
              },
              items: const [
                DropdownMenuItem(value: 'Bintang 1', child: Text('Bintang 1')),
                DropdownMenuItem(value: 'Bintang 2', child: Text('Bintang 2')),
                DropdownMenuItem(value: 'Bintang 3', child: Text('Bintang 3')),
                DropdownMenuItem(value: 'Bintang 4', child: Text('Bintang 4')),
                DropdownMenuItem(value: 'Bintang 5', child: Text('Bintang 5'))
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
                  biaya: biayaController.text,
                  popularitas: popularitasController.text,
                  fasilitas: fasilitasController.text,
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
