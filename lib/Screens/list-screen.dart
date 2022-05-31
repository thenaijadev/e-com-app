import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shp2/utilities/list.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Lists(),
      child: Consumer<Lists>(
        builder: (context, lists, child) => ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return lists.myList[index];
          },
          itemCount: lists.myList.length,
        ),
      ),
    );
  }
}
