import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton ({super.key, required this.child, required this.onPressed});
  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        shape: const BeveledRectangleBorder(),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 25),
        textStyle: const TextStyle(fontFamily: "PatrickHandSC", fontSize: 20)
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}