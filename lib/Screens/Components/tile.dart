import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile(
      {Key? key,
      this.color,
      this.icon,
      this.text1,
      this.text2,
      this.namedRoute})
      : super(key: key);
  final Color? color;
  final IconData? icon;
  final String? text1;
  final String? text2;
  final String? namedRoute;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, "/repair");
      },
      highlightColor: Colors.black,
      splashColor: Colors.black,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        width: 300.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              icon,
              size: 60.0,
              color: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                text2!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ]),
      ),
    );
  }
}
