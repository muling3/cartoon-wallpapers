import 'package:cartoon_wallpapers/components/app_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CartoonItemScreen extends StatelessWidget {
  const CartoonItemScreen(
      {super.key, required this.image, required this.index});

  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyCustomAppbar(),
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Positioned.fill(
              child: Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -10,
                  intensity: 0.86,
                  lightSource: LightSource.topLeft,
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: const [
                    Icon(
                      Icons.add_to_drive_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Icon(
                      Icons.download_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
