import 'package:flutter/material.dart';
import 'package:telefoni_dashboard/presentation/theme.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton(
      {super.key, required this.child, required this.onPressed});
  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(6, 6))),
        backgroundColor: MyColors.primaryColor,
        textStyle: const TextStyle(
          fontFamily: "Poppins",
          color: Colors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        child: child,
      ),
    );
  }
}
