import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shp2/Screens/cart-screen.dart';
import 'package:shp2/Screens/repair-screen.dart';
import 'package:shp2/Screens/welcome-screen.dart';
import 'Screens/login-screen.dart';
import 'Screens/signup-screen.dart';
import 'Screens/repair-screen.dart';
import 'Screens/home-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'utilities/form-validity.dart';

//The code below initializes firebase.
void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ValidityData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "/",
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const WelcomePage(),
          "/repair": (context) => const RepairScreen(),
          '/home': (context) => const HomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/cart': (context) => const CartScreen()
        },
      ),
    );
  }
}
