import 'package:get/get.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/telephone.dart';
import 'package:telefoni_dashboard/domain/use_cases/recuperer_liste_produits.dart';

class ProduitController extends GetxController {
  final RecupererListeProduits recupererListeProduits;

  ProduitController({required this.recupererListeProduits});

  var errorMessage = "".obs;
  var produits = <Telephone>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    final response = await recupererListeProduits.execute();

    response.fold(
      (failure) {
        if (failure is ServerFailure) {
          errorMessage.value = "Impossible de recuperer la liste de produits";
          isLoading.value = false;
        }
      },
      (produitsList) {
        produits.value = produitsList;
        isLoading.value = false;
      },
    );
  }
}
