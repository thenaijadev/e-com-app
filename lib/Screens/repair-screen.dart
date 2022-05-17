import 'package:flutter/material.dart';

class RepairScreen extends StatefulWidget {
  const RepairScreen({Key? key}) : super(key: key);

  @override
  State<RepairScreen> createState() => _RepairScreenState();
}

class _RepairScreenState extends State<RepairScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 243),
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 243, 178, 158),
        elevation: 0,
        title: const Center(
          child: Text(
            "Fix Microwave",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 70),
            width: double.infinity,
            height: 320,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 178, 158),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(48), // Image radius
                child: Image.asset('images/rec.jpg', fit: BoxFit.fill),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 0,
                  color: const Color.fromARGB(255, 243, 178, 158),
                  shadowColor: const Color.fromARGB(255, 30, 42, 109),
                  child: const SizedBox(
                    height: 63.0,
                    width: 238,
                    child: Center(
                      child: Text(
                        "Reviews",
                        style: TextStyle(
                            color: Color.fromARGB(255, 211, 211, 211),
                            fontFamily: "Roboto",
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 0,
                  color: Colors.black,
                  shadowColor: const Color.fromARGB(255, 30, 42, 109),
                  child: SizedBox(
                      height: 63.0,
                      width: 90,
                      child: Image.asset("images/chat.png")),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 0,
              color: const Color.fromARGB(255, 241, 245, 253),
              shadowColor: const Color.fromARGB(255, 26, 28, 41),
              child: SizedBox(
                height: 70.0,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/cart");
                    },
                    child: const ListTile(
                      leading: Text("Repair"),
                      trailing: Text("\$52"),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 0,
              color: const Color.fromARGB(255, 241, 245, 253),
              shadowColor: const Color.fromARGB(255, 26, 28, 41),
              child: SizedBox(
                height: 70.0,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/cart");
                    },
                    child: const ListTile(
                      leading: Text("Setup"),
                      trailing: Text("\$12"),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 0,
                  color: Colors.black,
                  shadowColor: const Color.fromARGB(255, 30, 42, 109),
                  child: const SizedBox(
                    height: 63.0,
                    width: 165,
                    child: Center(
                      child: Text(
                        "Order Setup",
                        style: TextStyle(
                            color: Color.fromARGB(255, 249, 249, 249),
                            fontFamily: "Roboto",
                            fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 0,
                  color: Colors.white,
                  shadowColor: const Color.fromARGB(255, 30, 42, 109),
                  child: const SizedBox(
                    height: 63.0,
                    width: 165,
                    child: Center(
                      child: Text(
                        "Order Setup",
                        style: TextStyle(
                            color: Color.fromARGB(255, 27, 27, 29),
                            fontFamily: "Roboto",
                            fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
