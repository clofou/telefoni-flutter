import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:telefoni_dashboard/presentation/pages/commandes/ajouter_commande_page.dart';
import 'package:telefoni_dashboard/presentation/pages/commandes/commande_page.dart';
import 'package:telefoni_dashboard/presentation/pages/connexion/connexion_page.dart';
import 'package:telefoni_dashboard/presentation/pages/dashboard/dashboard_page.dart';
import 'package:telefoni_dashboard/presentation/pages/template.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => ConnexionPage()),
    GetPage(name: '/dashboard', page: () => const DashboardPage()),
    GetPage(name: '/commandes', page: () => CommandePage()),
    GetPage(name: '/template', page: () => TemplatePage()),
    GetPage(name: '/commandes/add', page: () => AjouterCommandePage()),
    // Ajoutez d'autres routes ici
  ];
}
