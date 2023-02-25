import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyCustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: -8,
                surfaceIntensity: 0.86,
                lightSource: LightSource.topLeft,
                color: Colors.grey,
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(12.0),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
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
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                child: const Text(
                  "Cartoon Wallpapers",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
