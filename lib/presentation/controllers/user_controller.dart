import 'package:get/get.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/user.dart';
import 'package:telefoni_dashboard/domain/use_cases/recuper_current_user_info.dart';

class UserController extends GetxController {
  final RecuperCurrentUserInfo recuperCurrentUserInfo;
  var currentUser = User(nom: "", email: "", adresse: "", role: "", photoUrl: "", telephone: "").obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;

  UserController({required this.recuperCurrentUserInfo});

  @override
  void onInit() {
    super.onInit();
    recupererInfo(); // Appel automatique lors de l'initialisation
  }

  Future<void> recupererInfo() async {
    isLoading.value = true;
    final result = await recuperCurrentUserInfo.execute();

    result.fold((failure) {
      if (failure is ServerFailure) {
        errorMessage.value = 'Impossible de récupérer l\'utilisateur';
      } else if (failure is CacheFailure) {
        errorMessage.value = 'Erreur de cache, vérifiez votre connexion';
      }
    }, (user) {
      currentUser.value = user;
      isLoading.value = false;
    });
  }
}
