import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({
    Key? key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);
  final String? hintText;
  final void Function(String)? onChanged;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String? hintText;
  void Function(String)? onChanged;

  @override
  void initState() {
    super.initState();
    hintText = widget.hintText;
    onChanged = widget.onChanged;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 5,
        color: Colors.white,
        shadowColor: const Color.fromARGB(255, 6, 10, 14),
        child: SizedBox(
          height: 63.0,
          child: Center(
            child: TextFormField(
              onChanged: onChanged,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: hintText,
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
