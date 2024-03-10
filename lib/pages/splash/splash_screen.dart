import 'package:flutter/material.dart';
import 'splash_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: PageView(
        controller: controller,
        children: const [
          SplashPage(
              definition: "Temukan Tujuan Wisata Terbaik",
              imagePath: "assets/json/lottie_screen.json"),
          SplashPage(
              definition: "Kenali Informasi Tentang Tujuan Wisata",
              imagePath: "assets/json/lottie_splash.json"),
        ],
      ),
    );
  }
}
