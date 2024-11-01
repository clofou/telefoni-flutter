// lib/presentation/controllers/connexion_controller.dart

import 'package:get/get.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/auth_service.dart';
import 'package:telefoni_dashboard/models/connexion_model.dart';

class AuthController extends GetxController {
  final AuthService connexionUseCase = AuthService();
  var isLoading = false.obs;
  var errorMessage = ''.obs;


  Future<void> login(String email, String motDePasse) async {
    isLoading.value = true;
    final result = await connexionUseCase.connexion(ConnexionModel(email: email, motDePasse: motDePasse));

    result.fold(
      (failure) {
        // Gestion des erreurs
        if (failure is ServerFailure) {
          errorMessage.value = 'Erreur Serveur, réessayez plus tard';
        } else if (failure is CacheFailure) {
          errorMessage.value = 'Erreur de cache, vérifiez votre connexion';
        }
      },
      (connexion) {
        // En cas de succès
        print(connexion);
        Get.toNamed("/template"); // Naviguer vers la page Dashboard
      },
    );

    isLoading.value = false;
  }

  deconnexion(){
    connexionUseCase.logout();
  }
}
