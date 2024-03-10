import 'package:flutter/material.dart';
import 'package:xkate_app/database/db_helper.dart';
import 'package:xkate_app/model/model_db.dart';

class HasilRekomendasiDialog extends StatefulWidget {
  final Inputan inputan;

  const HasilRekomendasiDialog({
    Key? key,
    required this.inputan,
  }) : super(key: key);

  @override
  State<HasilRekomendasiDialog> createState() => _HasilRekomendasiDialogState();
}

class _HasilRekomendasiDialogState extends State<HasilRekomendasiDialog> {
  late Future<Map<Wisata, double>> _hasilRekomendasi;

  @override
  void initState() {
    super.initState();
    _hasilRekomendasi = _cariRekomendasi();
  }

  Future<Map<Wisata, double>> _cariRekomendasi() async {
    return await DatabaseHelper().cariRekomendasi(widget.inputan);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Hasil Rekomendasi'),
      content: FutureBuilder<Map<Wisata, double>>(
        future: _hasilRekomendasi,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final hasil = snapshot.data!;
            return SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Nama Wisata')),
                  DataColumn(label: Text('Persentase Kesamaan')),
                ],
                rows: hasil.entries.map((entry) {
                  final wisata = entry.key;
                  final persentase = entry.value * 100;
                  return DataRow(cells: [
                    DataCell(Text(wisata.nama)),
                    DataCell(Text('${persentase.toStringAsFixed(2)}%')),
                  ]);
                }).toList(),
              ),
            );
          }
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Tutup'),
        ),
      ],
    );
  }
}
