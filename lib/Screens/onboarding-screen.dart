import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Slide> slides = [];

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("images/makemoney.jpg"), context);
    precacheImage(const AssetImage("images/savemoney.jpg"), context);
    precacheImage(const AssetImage("images/shop-woman.jpg"), context);
    print("cache");
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        widgetDescription: Column(
          children: const [
            Center(
              child: Text(
                "Save Money",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                " Shop online at the best prices possible and put some money back into your pocket.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        pathImage: "images/savemoney.jpg",
        heightImage: 300.0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );

    slides.add(
      Slide(
        widgetDescription: Column(
          children: const [
            Center(
              child: Text(
                "Make Money",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                " Create and monitor your online store. Add products, set prices and chat with potential customers.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        pathImage: "images/makemoney.jpg",
        heightImage: 300.0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
    slides.add(
      Slide(
        widgetDescription: Column(
          children: const [
            Center(
              child: Text(
                "Relevant products.",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "Do your shoping securely online. Browse through relevant products from vendors nearby.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        pathImage: "images/shop-woman.jpg",
        heightImage: 300.0,
        backgroundColor: const Color.fromARGB(255, 179, 224, 255),
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    print("End of slides");
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      renderDoneBtn: Container(
        width: 300,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 144, 239),
            borderRadius: BorderRadius.circular(50.0)),
      ),
      renderSkipBtn: const Text(
        "Skip",
        style: TextStyle(color: Color.fromARGB(255, 0, 144, 239)),
      ),
      renderNextBtn: Container(
        width: 200,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "Next",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 144, 239),
            borderRadius: BorderRadius.circular(50.0)),
      ),
      colorActiveDot: Colors.blue,
      colorDot: const Color.fromARGB(255, 155, 155, 155),
      scrollPhysics: const BouncingScrollPhysics(),
      slides: slides,
      sizeDot: 12,
      onDonePress: () {
        Navigator.pushNamed(context, "/login");
      },
    );
  }
}
