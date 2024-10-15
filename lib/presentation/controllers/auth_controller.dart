// lib/presentation/controllers/connexion_controller.dart

import 'package:get/get.dart';
import 'package:telefoni_dashboard/domain/use_cases/se_connecter.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';

class ConnexionController extends GetxController {
  final ConnexionUseCase connexionUseCase;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  ConnexionController({required this.connexionUseCase});

  Future<void> login(String email, String motDePasse) async {
    isLoading.value = true;
    final result = await connexionUseCase.execute(email, motDePasse);

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
        storeToken(connexion.token);
        Get.toNamed("/template"); // Naviguer vers la page Dashboard
      },
    );

    isLoading.value = false;
  }

  void storeToken(String token) {
    // Ici on peut utiliser un package comme SharedPreferences ou SecureStorage pour stocker le token
  }
}
