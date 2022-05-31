import 'package:flutter/material.dart';
import 'package:shp2/Screens/Components/button.dart';
import 'package:shp2/Screens/Components/password-input.dart';
import 'Components/input.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:shp2/utilities/form-validity.dart';
import 'package:provider/provider.dart';

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

  String? email;
  String? password;
  bool isTooShort = false;
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
          Input(
            onChanged: (value) {
              email = value;
            },
            hintText: 'Email',
          ),
          PasswordInput(
            onChanged: (value) {
              password = value;
            },
            hintText: 'Password',
          ),
          SizedBox(
            child: Center(
                child: Text(
              Provider.of<ValidityData>(context, listen: false).isUserNotFound
                  ? "No user found for that email."
                  : "",
              style: const TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(255, 245, 16, 0)),
            )),
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Center(
              child: Text(
                isTooShort ? "Password is too short" : "",
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
          SizedBox(
            child: Center(
                child: Text(
              Provider.of<ValidityData>(context, listen: false).isWrongPassword
                  ? "Invalid Password"
                  : "",
              style: const TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 245, 16, 0),
              ),
            )),
            height: Provider.of<ValidityData>(context, listen: false)
                    .isWrongPassword
                ? 30
                : 0,
          ),
          Button(
            onpressed: () async {
              if (password!.length < 6) {
                setState(() {
                  isTooShort = true;
                  Provider.of<ValidityData>(context, listen: false).isFalse();
                });
              } else {
                setState(() {
                  isTooShort = false;
                });
                Provider.of<ValidityData>(context, listen: false).isTrue();
                try {
                  final newUser = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email!, password: password!);
                  setState(() {
                    Provider.of<ValidityData>(context, listen: false).isTrue();
                  });
                  Navigator.pushNamed(context, "/home");
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    setState(() {
                      Provider.of<ValidityData>(context, listen: false)
                          .userNotFound();
                    });
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    setState(() {
                      Provider.of<ValidityData>(context, listen: false)
                          .wrongPassword();
                      Provider.of<ValidityData>(context, listen: false)
                          .isFalse();
                    });
                    print('Wrong password provided for that user.');
                  }
                }
              }
            },
          ),
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
          // const SocialButtons(),
          const SizedBox(
            height: 50.0,
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
                  Provider.of<ValidityData>(context, listen: false).isTrue();
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
