import 'package:flutter/material.dart';
import 'package:shp2/Screens/Components/button.dart';
import 'package:shp2/Screens/Components/cart-tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 243),
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 238, 237, 243),
        elevation: 0,
        title: const Center(
          child: Text(
            "Cart",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            ChartTile(
              padding: 0,
              elevation: 0,
              icon: Image.asset("images/cart-tile-icon.png"),
              title: "Fix Microwave",
              subTitle: "Kitchen",
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 30.0),
              child: Material(
                elevation: 0,
                color: const Color.fromARGB(255, 214, 227, 255),
                shadowColor: const Color.fromARGB(255, 26, 28, 41),
                child: SizedBox(
                  height: 70.0,
                  child: Center(
                    child: ListTile(
                      leading: Container(
                        width: 19,
                        height: 19,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/red.png"),
                              fit: BoxFit.cover),
                        ),
                        child: Image.asset("images/Line2.png"),
                      ),
                      title: const Text("Set up microwave"),
                      trailing: const SizedBox(
                        child: Text(
                          "\$22",
                          style: TextStyle(color: Colors.grey, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 30.0),
              child: Material(
                elevation: 0,
                color: const Color.fromARGB(255, 214, 227, 255),
                shadowColor: const Color.fromARGB(255, 26, 28, 41),
                child: SizedBox(
                  height: 70.0,
                  child: Center(
                    child: ListTile(
                      leading: Container(
                        width: 19,
                        height: 19,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/red.png"),
                              fit: BoxFit.cover),
                        ),
                        child: Image.asset("images/Line2.png"),
                      ),
                      title: const Text("Set up microwave"),
                      trailing: const SizedBox(
                        child: Text(
                          "\$80",
                          style: TextStyle(color: Colors.grey, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ChartTile(
              elevation: 0,
              cost: "\$70",
              icon: Image.asset("images/cart-tile-icon.png"),
              title: "Fix Fridge",
              subTitle: "2 Service",
            ),
            ChartTile(
              elevation: 0,
              cost: "\$135",
              icon: Image.asset("images/cart-tile-icon.png"),
              title: "Fix Washer",
              subTitle: "1 Service",
            ),
            ChartTile(
              elevation: 0,
              cost: "\$30",
              icon: Image.asset("images/cart-tile-icon.png"),
              title: "Fix Computer",
              subTitle: "1 Service",
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      "Total Price",
                      style: TextStyle(color: Colors.grey, fontSize: 18.0),
                    ),
                    Text("\$302"),
                  ],
                ),
                const Button(
                  padding: 5.0,
                  color: Colors.black,
                  buttonText: "Make an order.",
                )
              ],
            )
          ]),
        ],
      ),
    );
  }
}
