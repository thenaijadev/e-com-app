import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 0.2,
            color: Colors.white,
            shadowColor: const Color.fromARGB(255, 30, 42, 109),
            child: SizedBox(
              height: 63.0,
              width: 100.0,
              child: Center(
                  child: Image.asset("images/flat-color-icons_google.png")),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 0.2,
            color: Colors.white,
            shadowColor: const Color.fromARGB(255, 30, 42, 109),
            child: SizedBox(
              height: 63.0,
              width: 100.0,
              child: Center(
                child: Image.asset("images/eva_facebook-fill.png"),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 0.2,
            color: Colors.white,
            shadowColor: const Color.fromARGB(255, 30, 42, 109),
            child: SizedBox(
              height: 63.0,
              width: 100.0,
              child: Center(
                child: Image.asset("images/Vector.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
