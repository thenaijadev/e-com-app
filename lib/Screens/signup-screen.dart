import 'package:flutter/material.dart';
import 'package:shp2/Screens/Components/button.dart';
import 'package:shp2/Screens/Components/password-input.dart';
import 'package:shp2/Screens/Components/social-buttons.dart';
import 'Components/input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
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
        children: const [
          Image(
            image: AssetImage('images/Group 3.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text('Login to your account',
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20.0,
                )),
          ),
          Input(
            hintText: 'Email',
          ),
          PasswordInput(
            hintText: 'Password',
          ),
          PasswordInput(
            hintText: 'Confirm password',
          ),
          Button(
            buttonText: "Sign up",
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              " • Or sign up with  • ",
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0),
            ),
          ),
          SocialButtons(),
        ],
      ),
    );
  }
}
