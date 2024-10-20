import 'package:get/get.dart';
import 'package:telefoni_dashboard/data/models/utilisateur_nouveau_dto.dart';
import 'package:telefoni_dashboard/domain/use_cases/recuperer_nouveau_utilisateur.dart';

class UtilisateurController extends GetxController {
  final RecupereNouveauxUtilisateurs recupereNouveauxUtilisateurs;

  UtilisateurController({required this.recupereNouveauxUtilisateurs});

  var utilisateurs = <UtilisateurNouveauDTO>[].obs;
  var pourcentageVariation = 0.0.obs;
  var erroMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchUtilisateurs();
  }

  void fetchUtilisateurs() async {
    final result1 = await recupereNouveauxUtilisateurs.execute();

    result1.fold(
      (failure) {
        erroMessage.value = "Erreur lors du chargement des utilisateurs";
      },
      (result) {
        utilisateurs.value =
            result['utilisateurs'] as List<UtilisateurNouveauDTO>;
        pourcentageVariation.value = result['pourcentageVariation'] as double;
      },
    );
  }
}
