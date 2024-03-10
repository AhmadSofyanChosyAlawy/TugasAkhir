import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xkate_app/widgets/tourist_box.dart';
import 'package:xkate_app/widgets/foto_box.dart';

class JelajahWisataScreen extends StatefulWidget {
  const JelajahWisataScreen({
    super.key,
  });

  @override
  State<JelajahWisataScreen> createState() => _JelajahWisataScreenState();
}

class _JelajahWisataScreenState extends State<JelajahWisataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: 'Cari Tempat Wisata',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Jelajah Wisata Tegal",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TouristBox(),
          paddingBawah(),
          const FotoBox(),
        ],
      ),
    );
  }

  Padding paddingBawah() {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Foto Obyek Wisata",
            style: GoogleFonts.openSans(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
          Text(
            "Lihat Semua",
            style: GoogleFonts.openSans(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.amber),
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  // Padding paddingAtas() {
  //   return Padding(
  //     padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           "Semua",
  //           style:
  //               GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.bold),
  //           maxLines: 2,
  //         ),
  //         Text(
  //           "Lihat Semua",
  //           style: GoogleFonts.openSans(
  //               fontSize: 14, fontWeight: FontWeight.bold, color: Colors.amber),
  //           maxLines: 2,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
