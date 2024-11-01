import 'package:get/get.dart';
import 'package:telefoni_dashboard/data/commande_service.dart';

class CommandeController extends GetxController {
  CommandeService commandeService = CommandeService();

  var isLoadingList = false.obs;
  var errorMessageCommandeList = "".obs;
  var commandes = [].obs;
}