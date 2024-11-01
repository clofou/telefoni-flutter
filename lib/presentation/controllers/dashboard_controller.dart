import 'package:get/get.dart';
import 'package:telefoni_dashboard/models/utilisateur_nouveau_dto.dart';

class DashboardController extends GetxController {

  // BigCard
  var venteTotal = 0.obs;
  var totalCommande = 0.obs;


  var totalVentesOccasion = 0.obs;
  var totalVentesNeuf = 0.obs;
  var mesventes = [].obs;

  var isLoading = false.obs;

  // Utilisateurs
  var utilisateurs = <UtilisateurNouveauDTO>[].obs;
  var userIncrease = 0.0.obs;
}