import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shp2/utilities/form-validity.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);
  final String? hintText;
  final void Function(String)? onChanged;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  String? hintText;
  void Function(String)? onChanged;
  bool isObscured = true;
  @override
  void initState() {
    super.initState();
    hintText = widget.hintText;

    onChanged = widget.onChanged;
  }

  void obscure() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 5,
        color: Provider.of<ValidityData>(context).isValid
            ? Colors.white
            : Colors.red,
        shadowColor: const Color.fromARGB(255, 6, 10, 14),
        child: SizedBox(
          height: 63.0,
          child: Center(
            child: TextFormField(
              minLines: 1,
              obscureText: isObscured,
              onChanged: onChanged,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: 0.0,
                  ),
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: obscure,
                    child:
                        Icon(isObscured ? Icons.lock_outline : Icons.lock_open),
                  ),
                ),
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
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
