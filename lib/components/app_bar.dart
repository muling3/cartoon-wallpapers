import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyCustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: kToolbarHeight * 0.6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Neumorphic(
              padding: const EdgeInsets.all(12.0),
              style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: -10,
                surfaceIntensity: 1.0,
                lightSource: LightSource.topLeft,
                oppositeShadowLightSource: true,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 28.0,
              ),
            ),
          ),
          Neumorphic(
            padding: const EdgeInsets.all(12),
            style: NeumorphicStyle(
              shape: NeumorphicShape.convex,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: -10,
              intensity: 1.0,
              lightSource: LightSource.topLeft,
              oppositeShadowLightSource: true,
              color: Colors.white,
            ),
            child: const Text(
              "Cartoon Wallpapers",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
