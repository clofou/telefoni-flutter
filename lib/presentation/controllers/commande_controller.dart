import 'package:get/get.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/commande.dart';
import 'package:telefoni_dashboard/domain/use_cases/recupere_nombre_commande.dart';
import 'package:telefoni_dashboard/domain/use_cases/recuperer_liste_commande.dart';

class CommandeController extends GetxController {
  final RecupereNombreCommande recupereNombreCommande;
  final RecupererListeCommande recupererListeCommande;

  var commandes = <Commande>[].obs;
  var nombreCommande = "0".obs;
  var errorMessageCommandeList = "".obs;
  var errorMessageNombre = "".obs;
  var isLoadingList = false.obs;
  var isLoadingNumber = false.obs;

  CommandeController(
      {required this.recupereNombreCommande,
      required this.recupererListeCommande});

  @override
  void onInit() {
    super.onInit();
    fetchCommandes();
    numberOfCommandes();
  }

  void fetchCommandes() async {
    isLoadingList.value = true;
    final result = await recupererListeCommande.execute();
    result.fold((failure) {
      if (failure is ServerFailure) {
        errorMessageCommandeList.value =
            "Impossible de recuperer la liste de commandes";
        isLoadingList.value = false;
      }
    }, (commandesList) {
      commandes.value = commandesList;
      isLoadingList.value = false;
    });
  }

  void numberOfCommandes() async {
    isLoadingNumber.value = true;
    final result = await recupereNombreCommande.execute();

    result.fold((failure) {
      if (failure is ServerFailure) {
        errorMessageNombre.value = "Nombre ??";
      }
    }, (nombre) {
      nombreCommande.value = nombre;
    });
  }
}
