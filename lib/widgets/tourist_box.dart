import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xkate_app/model/local/model_foto.dart';
import 'package:xkate_app/model/local/model_jelajah.dart';
import 'package:xkate_app/pages/detail_page_jelajah.dart';

class TouristBox extends StatelessWidget {
  const TouristBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      height: 280,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataJelajah.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailPage(
                        jelajah: dataModel[index],
                        jelajahModel: dataJelajah[index],
                      );
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12, top: 10),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(dataJelajah[index].touristBox),
                          fit: BoxFit.cover)),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20)),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          dataJelajah[index].namaWisata,
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          dataJelajah[index].jenisWisata.toUpperCase(),
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          dataJelajah[index].lokasiWisata,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
