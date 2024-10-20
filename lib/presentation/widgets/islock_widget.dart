import 'package:flutter/material.dart';

class IslockWidget extends StatelessWidget {
  const IslockWidget({super.key, required this.isLock});
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 80,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisAlignment:
            isLock ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            width: 30,
            color: isLock ? Colors.red : Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Center(
              child: Text(
                isLock ? "Y" : "N",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
