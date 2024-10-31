import 'package:flutter/material.dart';
import 'package:telefoni_dashboard/presentation/theme.dart';

class MyCustomTextField extends StatelessWidget {
  const MyCustomTextField(
      {super.key,
      this.onChanged,
      this.controller,
      this.keyboardType,
      this.mykey,
      this.suffixIcon,
      this.hintText,
      this.labelText,
      this.obscureText = false,
      this.prefixIcon,
      this.onPressed, this.validator, this.initialValue});
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Key? mykey;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final void Function(String)? onChanged;
  final VoidCallback? onPressed;
  final String? Function(String?)? validator;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(59, 158, 158, 158)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(20, 0, 0, 0), // Couleur de l'ombre
              blurRadius: 20,
              spreadRadius: 12, // Rayon de flou
              offset: Offset(0, 2), // Décalage de l'ombre
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.elliptical(12, 12))),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText ?? "",
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          TextFormField(
            onChanged: onChanged,
            cursorColor: MyColors.secondaryColor,
            initialValue: initialValue,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(color: MyColors.grey, fontSize: 14, fontFamily: "Poppins"),
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }
}
