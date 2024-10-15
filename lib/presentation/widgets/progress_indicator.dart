import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({
    super.key,
    required this.percentage,
    required this.barColor,
  });

  final double percentage;
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: percentage,
      backgroundColor: barColor.withOpacity(0.2),
      valueColor: AlwaysStoppedAnimation<Color>(barColor),
      minHeight: 5,
    );
  }
}
