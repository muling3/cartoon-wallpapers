import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.copyright, color: Colors.white),
        Text(
          "2023 by Alexander Muli",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
