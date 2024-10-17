import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/presentation/controllers/navigation/navigation_controller.dart';
import 'package:telefoni_dashboard/presentation/pages/commandes/commande_page.dart';
import 'package:telefoni_dashboard/presentation/pages/dashboard/dashboard_page.dart';
import 'package:telefoni_dashboard/presentation/pages/parametre/parametre_page.dart';
import 'package:telefoni_dashboard/presentation/pages/produits/telephone_page.dart';
import 'package:telefoni_dashboard/presentation/widgets/navigation_rail.dart'; // Exemple d'une page

class TemplatePage extends StatelessWidget {
  TemplatePage({super.key});

  final NavigationController _navController = Get.put(NavigationController());

  final List<Widget> _pages = [
    DashboardPage(), // Remplacer par tes pages
    const Center(child: Text('LeaderBoard Page')),
    CommandePage(),
    TelephonePage(),
    const Center(child: Text('Litige Page')),
    const Center(child: Text('Controllers Page')),
    const ParametrePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 240, 164),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyNavigationRail(),
            const SizedBox(width: 20,), // Ajout du rail de navigation
            Expanded(
              child: Obx(() => SingleChildScrollView(child: _pages[_navController.selectedIndex.value])),
            ),
          ],
        ),
      ),
    );
  }
}
