import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:telefoni_dashboard/presentation/pages/commandes/commande_page.dart';
import 'package:telefoni_dashboard/presentation/pages/connexion/connexion_page.dart';
import 'package:telefoni_dashboard/presentation/pages/dashboard/dashboard_page.dart';
import 'package:telefoni_dashboard/presentation/pages/template.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => ConnexionPage()),
    GetPage(name: '/dashboard', page: () => DashboardPage()),
    GetPage(name: '/commandes', page: () => CommandePage()),
    GetPage(name: '/template', page: () => TemplatePage()),
    // Ajoutez d'autres routes ici
  ];
}
