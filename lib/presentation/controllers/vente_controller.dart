import 'package:get/get.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/vente_type.dart';
import 'package:telefoni_dashboard/domain/use_cases/creer_graphe_occasion_neuf.dart';

class VenteController extends GetxController {
  final GetVentesOccasionVsNeuf getVentesOccasionVsNeuf;
  
  // Liste des ventes
  var mesventes = <VenteType>[].obs;
  
  // Indicateur de chargement
  var isLoading = true.obs;
  
  // Message d'erreur
  var errorMessage = "".obs;
  
  // Totaux observables pour les ventes d'occasion et neuf
  var totalVentesOccasion = 0.obs;
  var totalVentesNeuf = 0.obs;

  VenteController(this.getVentesOccasionVsNeuf);

  @override
  void onInit() {
    super.onInit();
    fetchVentes();
  }

  // Fonction pour récupérer les ventes
  void fetchVentes() async {
    isLoading(true);
    var result = await getVentesOccasionVsNeuf();
    
    result.fold((failure) {
      if (failure is ServerFailure) {
        errorMessage.value = "Impossible de construire le graph";
        isLoading.value = false;
      }
    }, (ventes) {
      mesventes.value = ventes;
      
      // Calcul des ventes totales d'occasion et neuf
      totalVentesOccasion.value = mesventes.fold(
        0, (sum, vente) => sum + vente.ventesOccasion);
        
      totalVentesNeuf.value = mesventes.fold(
        0, (sum, vente) => sum + vente.ventesNeuf);
      
      isLoading.value = false;
    });
  }
}
