import 'package:get/get.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/models/card_vente_model.dart';
import 'package:telefoni_dashboard/domain/use_cases/recuperer_vente_total.dart';

class DisplayVenteTotalController extends GetxController {
  final RecupererVenteTotal recupererVenteTotal;
  var errorMessage = "".obs;
  var isLoading = false.obs;
  var suffix = "".obs;
  var venteTotal =
      CardVenteModel(pourcentageVariation: 0, totalMontantVentes: 0).obs;

  DisplayVenteTotalController({required this.recupererVenteTotal});

  @override
  void onInit() {
    super.onInit();
    fetchVentes();
  }

  fetchVentes() async {
    final result = await recupererVenteTotal.execute();

    result.fold((failure) {
      isLoading.value = true;
      if (failure is ServerFailure) {
        errorMessage.value = "Erreur lors de la récupération des données";
      }
    }, (valeur) {
      // Appelle la méthode de formatage ici
      venteTotal.value = CardVenteModel(
          pourcentageVariation: valeur.pourcentageVariation,
          totalMontantVentes: formatNumber(valeur.totalMontantVentes));
    });
  }

  // Méthode pour formater le nombre
  double formatNumber(double number) {
    if (number >= 1000000000) {
      suffix.value = "B";
      return (number / 1000000000);
    } else if (number >= 1000000) {
      suffix.value = "M";
      return (number / 1000000);
    } else if (number >= 1000) {
      suffix.value = "K";
      return (number / 1000);
    } else {
      return number;
    }
  }
}
