import 'package:get/get.dart';
import 'package:telefoni_dashboard/domain/use_cases/se_deconnecter.dart';
import 'package:telefoni_dashboard/presentation/services/dialog_service.dart';

class DeconnexionController extends GetxController {
  final SeDeconnecterUseCase seDeconnecterUseCase;

  DeconnexionController({required this.seDeconnecterUseCase});

  // Méthode pour déconnecter l'utilisateur
  Future<void> logout() async {
    try {
      await seDeconnecterUseCase.execute();
      // Redirection vers la page de connexion
      Get.offAllNamed("/connexion");  // Remplace 'AppRoutes.login' par votre route de connexion
    } catch (error) {
      // Gérer les erreurs éventuelles
      Get.snackbar("Erreur", "Échec de la déconnexion");
    }
  }

  // Méthode pour afficher le dialogue de confirmation
  void showLogoutConfirmation() {
    DialogService.showLogoutConfirmationDialog(logout);
  }

}
