import 'package:flutter/material.dart';
import 'package:shp2/Screens/cart-screen.dart';
import 'package:shp2/Screens/repair-screen.dart';
import 'Screens/login-screen.dart';
import 'Screens/signup-screen.dart';
import 'Screens/repair-screen.dart';
import 'Screens/home-screen.dart';
import 'Screens/welcome-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
