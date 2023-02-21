import 'package:cartoon_wallpapers/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CartoonWallpapers());
}

class CartoonWallpapers extends StatelessWidget {
  const CartoonWallpapers({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartoon Wallpapers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
