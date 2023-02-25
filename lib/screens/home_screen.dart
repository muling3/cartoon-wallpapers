import 'package:cartoon_wallpapers/data/cartoons.dart';
import 'package:cartoon_wallpapers/screens/cartoon_file.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController(viewportFraction: 0.9);

  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var cartoons = cartoonsList();

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SafeArea(
              child: Container(
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
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartoons.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        // reverseTransitionDuration: const Duration(milliseconds: 600),
                        // transitionDuration: const Duration(milliseconds: 100),
                        pageBuilder:
                            (context, animation, secondaryAnimation) {
                          return ScaleTransition(
                            scale: animation,
                            alignment: Alignment.bottomCenter,
                            child: CartoonItemScreen(image: cartoons[index], index: index),
                          );
                        },
                        
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          depth: -10,
                          intensity: 0.86,
                          lightSource: LightSource.topLeft,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(cartoons[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    cartoons.length,
                    (index) {
                      return pageIndicator(active: index == currentPage);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pageIndicator({required bool active}) {
    return InkWell(
      onTap: () {
        _pageController.animateToPage(currentPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInSine);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 15,
        width: 15,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
