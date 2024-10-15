import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Litiges'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Paramètres'),
      ],
      currentIndex: 0, // Mettez à jour en fonction de l'index actuel
      onTap: (index) {
        // Logique de navigation
      },
    );
  }
}
