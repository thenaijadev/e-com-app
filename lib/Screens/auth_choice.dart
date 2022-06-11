import 'package:flutter/material.dart';
import 'package:shp2/utilities/BiometricHelper.dart';

class AuthChoice extends StatefulWidget {
  const AuthChoice({Key? key}) : super(key: key);

  @override
  State<AuthChoice> createState() => _AuthChoiceState();
}

class _AuthChoiceState extends State<AuthChoice> {
  bool showBiometrics = false;
  bool isAuthenticated = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isBiometricAvialble();
  }

  isBiometricAvialble() async {
    showBiometrics = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (showBiometrics)
            ElevatedButton(
              onPressed: () async {
                isAuthenticated = await BiometricHelper().authenticate();
                setState(() {});
              },
              child: const Text(
                "Biometric Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          const SizedBox(
            height: 50,
          ),
          if (isAuthenticated)
            const Text(
              "Well done,Authenticated,",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            )
        ]),
      ),
    );
  }
}
