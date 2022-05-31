import 'package:flutter/cupertino.dart';

class Lists extends ChangeNotifier {
  List<Widget> myList = [
    const Center(child: Text("HI")),
    const Center(child: Text("HI"))
  ];

  void addText(String text) {
    final newText = Text(text);
    myList.add(newText);
    notifyListeners();
  }

  void removeText(Text text) {
    myList.remove(text);
    notifyListeners();
  }
}
