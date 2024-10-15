import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  const MyCustomTextField(
      {super.key,
      this.controller,
      this.keyboardType,
      this.mykey,
      this.suffixIcon,
      this.hintText,
      this.labelText,
      this.obscureText = false, this.prefixIcon});
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Key? mykey;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String? hintText;
  final String? labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: const TextStyle(fontFamily: "PatrickHand", fontSize: 24),
          ),
        TextFormField(
          cursorColor: Theme.of(context).primaryColor,
          obscureText: obscureText,
          key: mykey,
          keyboardType: keyboardType,
          controller: controller,
          style: const TextStyle(fontFamily: "PatrickHand"),
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              prefixIconColor: Theme.of(context).primaryColor,
              suffixIcon: suffixIcon,
              hintText: hintText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                borderRadius: const BorderRadius.all(Radius.zero),
              )),
        ),
      ],
    );
  }
}
