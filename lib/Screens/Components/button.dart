import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key, this.buttonText, this.color, this.padding, this.onpressed})
      : super(key: key);
  final String? buttonText;
  final Color? color;
  final double? padding;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: padding ?? 20.0, horizontal: 30.0),
      child: InkWell(
        onTap: onpressed,
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 5,
          color: color ?? const Color.fromARGB(255, 31, 49, 157),
          shadowColor: const Color.fromARGB(255, 30, 42, 109),
          child: SizedBox(
            height: 63.0,
            child: Center(
              child: Text(
                buttonText ?? "Sign In",
                style: const TextStyle(
                    color: Colors.white, fontFamily: "Roboto", fontSize: 20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
