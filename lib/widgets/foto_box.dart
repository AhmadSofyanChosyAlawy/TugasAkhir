import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xkate_app/model/local/model_foto.dart';
// import 'package:xkate_app/pages/detail_page_jelajah.dart';

class FotoBox extends StatelessWidget {
  const FotoBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();

    return ListView(
      shrinkWrap: true,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 150,
            viewportFraction: 0.8,
            autoPlay: true,
          ),
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Image(
                        image: AssetImage(dataModel[index].fotoBox),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            dataModel[index].jenisWisata.toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            dataModel[index].namaWisata,
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
          itemCount: dataModel.length,
          carouselController: controller,
        )
      ],
    );
  }
}
