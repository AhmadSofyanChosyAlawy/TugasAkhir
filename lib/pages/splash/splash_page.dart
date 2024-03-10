import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  final String definition;
  final String imagePath;

  const SplashPage({
    Key? key,
    required this.definition,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          imagePath,
          width: 300,
          height: 300,
          frameRate: const FrameRate(30),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            definition,
            textAlign: TextAlign.center,
            maxLines: 2,
            style:
                GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber[600])),
          child: Text(
            'Lanjutkan',
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
