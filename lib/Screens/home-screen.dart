import 'package:flutter/material.dart';
import 'package:shp2/Screens/Components/listView.dart';
import 'Components/cart-tile.dart';
import "package:firebase_auth/firebase_auth.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 243),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 238, 237, 243),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/cart");
              },
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            )
          ],
        ),
        leading: const Icon(
          Icons.menu,
          size: 30.0,
          color: Colors.black,
        ),
      ),
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 44, vertical: 8.0),
          child: Text(
            "What's broken?",
            style: TextStyle(color: Colors.black, fontSize: 22.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 0,
            color: Colors.white,
            shadowColor: const Color.fromARGB(255, 6, 10, 14),
            child: SizedBox(
              height: 49.0,
              child: Center(
                child: TextFormField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 211, 211, 211),
                    ),
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 211, 211, 211)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: "Search appliances.",
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 211, 211, 211), width: 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: Text(
            "Offers",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const ListViewHorizontal(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
          child: Text(
            "We can fix it.",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Offers",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Text(
              "Kitchen",
              style: TextStyle(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
            ),
            const Text(
              "Living Room",
              style: TextStyle(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
            ),
            const Text(
              "Bathroom",
              style: TextStyle(
                color: Color.fromARGB(255, 211, 211, 211),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
        ChartTile(
          elevation: 0,
          icon: Image.asset("images/cart-tile-icon.png"),
          title: "Fix Fridge",
          subTitle: "Kitcken",
        ),
        ChartTile(
          elevation: 0,
          icon: Image.asset("images/tvset.png"),
          title: "Fix TV Set",
          subTitle: "Living room.",
        ),
      ]),
    );
  }
}
