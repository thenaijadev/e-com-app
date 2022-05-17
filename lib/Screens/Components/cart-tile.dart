import 'package:flutter/material.dart';

class ChartTile extends StatelessWidget {
  const ChartTile(
      {Key? key,
      @required this.elevation,
      @required this.icon,
      this.padding,
      this.color,
      this.cost,
      this.title,
      this.subTitle})
      : super(key: key);
  final double? elevation;
  final Widget? icon;
  final Color? color;
  final String? cost;
  final String? title;
  final String? subTitle;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/repair");
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: padding ?? 10.0, horizontal: 30.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: elevation!,
          color: const Color.fromARGB(255, 241, 245, 253),
          shadowColor: const Color.fromARGB(255, 26, 28, 41),
          child: SizedBox(
            height: 70.0,
            child: ListTile(
              leading: Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: color ?? const Color.fromARGB(255, 199, 217, 255),
                ),
                child: icon,
              ),
              title: Text(title!),
              subtitle: Text(subTitle!),
              trailing: SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        cost ?? "",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 18.0),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 38.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
