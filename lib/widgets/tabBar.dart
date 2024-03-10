// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarContainer extends StatefulWidget {
  const TabBarContainer({super.key});

  @override
  State<TabBarContainer> createState() => _TabBarContainerState();
}

class _TabBarContainerState extends State<TabBarContainer>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return tabContainer(tabController: tabController);
  }
}

class tabContainer extends StatelessWidget {
  const tabContainer({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
          labelPadding: const EdgeInsets.only(right: 20),
          controller: tabController,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.amber,
          isScrollable: true,
          tabs: [
            Text(
              "Semua",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Wisata Alam",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
            Text("Wisata Buatan",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
            Text("Wisata Pantai",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
            Text("Wisata Sejarah",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
          ]),
    );
  }
}
