import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xkate_app/model/local/model_jelajah.dart';

class TabBarViewContainer extends StatefulWidget {
  const TabBarViewContainer({super.key});

  @override
  State<TabBarViewContainer> createState() => _TabBarViewContainerState();
}

class _TabBarViewContainerState extends State<TabBarViewContainer>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return Container(
      padding: const EdgeInsets.only(right: 12),
      height: 280,
      width: double.maxFinite,
      child: TabBarView(controller: tabController, children: [
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataJelajah.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
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
      ]),
    );
  }
}
