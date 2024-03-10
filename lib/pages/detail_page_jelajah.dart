import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xkate_app/model/local/model_foto.dart';
import 'package:xkate_app/model/local/model_jelajah.dart';

class DetailPage extends StatelessWidget {
  final FotoModel jelajah;
  final JelajahModel jelajahModel;
  const DetailPage(
      {super.key, required this.jelajah, required this.jelajahModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 280,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(jelajah.fotoBox),
                              fit: BoxFit.cover)),
                    )),
                const SafeArea(
                    child: BackButton(
                  color: Colors.white,
                )),
                Positioned(
                    top: 260,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jelajah.jenisWisata,
                            style: GoogleFonts.aBeeZee(
                                color: Colors.amber[400],
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                maxLines: 2,
                                jelajah.namaWisata,
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Icon(
                                Icons.route,
                                size: 32,
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_city,
                                color: Colors.black45,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                jelajah.lokasiWisata.toUpperCase(),
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              jelajahModel.deskripsi,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
