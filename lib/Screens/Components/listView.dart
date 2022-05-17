import 'package:flutter/material.dart';
import 'package:shp2/Screens/Components/tile.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({Key? key}) : super(key: key);

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) {
            if (i == 0) {
              return const Tile(
                color: Color.fromARGB(255, 20, 76, 230),
                icon: Icons.monetization_on,
                text1: "Micro Wave",
                text2: "28,400.20",
              );
            } else if (i == 1) {
              return const Tile(
                color: Color.fromARGB(255, 164, 20, 230),
                icon: Icons.house,
                text1: "Fridge",
                text2: "6,800",
              );
            } else if (i == 2) {
              return const Tile(
                color: Color.fromARGB(255, 70, 255, 101),
                icon: Icons.monetization_on_outlined,
                text1: "Heater",
                text2: "3.09",
              );
            } else {
              return const Tile(
                color: Color.fromARGB(255, 255, 22, 22),
                icon: Icons.dangerous,
                text1: "Gas Cooker",
                text2: "2000.00",
              );
            }
          }),
    );
  }
}
