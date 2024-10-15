import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/data/datasources/commande_local_data_source.dart';
import 'package:telefoni_dashboard/data/datasources/commande_remote_data_source.dart';
import 'package:telefoni_dashboard/data/repositories/commande_repository.dart';
import 'package:telefoni_dashboard/domain/use_cases/afficher_liste_de_commande.dart';
import 'package:telefoni_dashboard/domain/use_cases/ajouter_commande.dart';
import 'package:telefoni_dashboard/presentation/controllers/commande_controller.dart';
import 'package:telefoni_dashboard/presentation/widgets/commande_card.dart';

class CommandePage extends StatelessWidget {
  // Déclaration des membres
  late final CommandeRepository repository;
  late final AfficherListeDeCommandes afficherListeDeCommandes;
  late final AjouterCommande ajouterCommande;

  CommandePage({super.key}) {
    // Initialisation des données dans le constructeur
    CommandeLocalDataSource localDataSource = CommandeLocalDataSource();
    CommandeRemoteDataSource remoteDataSource = CommandeRemoteDataSource(
        'https://telefoni-backend.onrender.com'); // Remplacez par l'URL de votre API
    repository = CommandeRepository(remoteDataSource, localDataSource);
    afficherListeDeCommandes = AfficherListeDeCommandes(repository);
    ajouterCommande = AjouterCommande(repository);
  }

  @override
  Widget build(BuildContext context) {
    // Initialisation du contrôleur
    final CommandeController controller = Get.put(CommandeController(
      afficherListeDeCommandes,
      ajouterCommande,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Commandes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to("/commandes/add");
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.commandes.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.commandes.length,
          itemBuilder: (context, index) {
            return CommandeCard(commande: controller.commandes[index]);
          },
        );
      }),
    );
  }
}
