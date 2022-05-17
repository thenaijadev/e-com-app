import 'package:flutter/material.dart';
import 'package:shp2/Screens/Components/button.dart';
import 'package:shp2/Screens/Components/password-input.dart';
import 'package:shp2/Screens/Components/social-buttons.dart';
import 'Components/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249)
          .withOpacity(controller!.value),
      body: ListView(
        children: [
          const Image(
            image: AssetImage('images/Group 3.png'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text('Login to your account',
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20.0,
                )),
          ),
          const Input(
            hintText: 'Email',
          ),
          const PasswordInput(
            hintText: 'Password',
          ),
          const Button(),
          const SizedBox(
            height: 30.0,
          ),
          const Center(
            child: Text(
              " • Or sign in with  • ",
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0),
            ),
          ),
          const SocialButtons(),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "• Dont have an account? ",
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/signup");
                },
                child: const Material(
                  child: Text(
                    "Sign up ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 209, 211, 250),
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
