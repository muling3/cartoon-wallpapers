import 'package:cartoon_wallpapers/components/footer.dart';
import 'package:cartoon_wallpapers/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Cart8.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: const Text(
                    "Cartoon Wallpapers",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    FadeTransition(
                                      opacity: animation,
                                      child: const Home(),
                                    )),
                          ),
                        );
                      }),
                      child: Container(
                        width: size.width * 0.5,
                        height: 50,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Get Started"),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Footer()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
