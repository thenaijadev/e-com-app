import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shp2/Screens/Components/button.dart';
import 'package:shp2/Screens/Components/password-input.dart';
import 'Components/input.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:provider/provider.dart';
import 'package:shp2/utilities/form-validity.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  final auth = FirebaseAuth.instance;
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
  String? password = "";
  String? confirmPassword = "";
  bool isTooShort = false;
  bool isUserExist = false;
  bool _isSaving = false;
  Future<void> signUp() async {
    if (password!.length < 6 || confirmPassword!.length < 6) {
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
        if (password != confirmPassword) {
          Provider.of<ValidityData>(context, listen: false).isFalse();
        } else {
          Provider.of<ValidityData>(context, listen: false).isTrue();
          final newUser = await auth.createUserWithEmailAndPassword(
            email: email!,
            password: password!,
          );
          Navigator.pushNamed(context, "/home");
          setState(() {
            isUserExist = false;
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          setState(() {
            isUserExist = true;
          });
        }
      } catch (e) {
        print(e);
      }
      setState(() {
        _isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249)
          .withOpacity(controller!.value),
      body: ModalProgressHUD(
        inAsyncCall: _isSaving,
        progressIndicator:
            const CircularProgressIndicator(backgroundColor: Colors.red),
        child: ListView(
          children: [
            const Image(
              image: AssetImage('images/Group 3.png'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text('Create an account.',
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
              hintText: 'Password',
              onChanged: (value) {
                password = value;
                print("password");
              },
            ),
            PasswordInput(
              hintText: 'Confirm password',
              onChanged: (value) {
                confirmPassword = value;
                print(confirmPassword);
              },
            ),
            Center(
              child: Text(
                Provider.of<ValidityData>(context).isValid
                    ? ""
                    : "Please confirm the password correctly.",
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Center(
                child: Text(
                  isTooShort ? "The password provided is too weak." : "",
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Center(
                child: Text(
                  isUserExist
                      ? "An account already exists for that email."
                      : "",
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
            Button(
              buttonText: "Sign up",
              onpressed: () async {
                _isSaving = true;
                await signUp();
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Center(
              child: Text(
                " • Or sign up with  • ",
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
