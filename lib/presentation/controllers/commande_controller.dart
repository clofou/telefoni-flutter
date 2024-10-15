import 'package:get/get.dart';
import 'package:telefoni_dashboard/data/models/commande_model.dart';
import 'package:telefoni_dashboard/domain/use_cases/afficher_liste_de_commande.dart';
import 'package:telefoni_dashboard/domain/use_cases/ajouter_commande.dart';


class CommandeController extends GetxController {
  final AfficherListeDeCommandes afficherListeDeCommandes;
  final AjouterCommande ajouterCommande;

  var commandes = <CommandeModel>[].obs;

  CommandeController(this.afficherListeDeCommandes, this.ajouterCommande);

  @override
  void onInit() {
    super.onInit();
    fetchCommandes();
  }

  void fetchCommandes() async {
    commandes.value = await afficherListeDeCommandes.call();
  }

  void addCommande(CommandeModel commande) async {
    await ajouterCommande.call(commande);
    fetchCommandes(); // Recharger la liste des commandes
  }
}
