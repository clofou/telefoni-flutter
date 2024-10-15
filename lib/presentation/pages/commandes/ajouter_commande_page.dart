import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/data/models/commande_model.dart';
import 'package:telefoni_dashboard/presentation/controllers/commande_controller.dart';

class AjouterCommandePage extends StatelessWidget {
  final CommandeController _controller = Get.find();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController montantController = TextEditingController();
  final TextEditingController vendeurController = TextEditingController();
  final TextEditingController acheteurController = TextEditingController();

  AjouterCommandePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter Commande'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Titre'),
            ),
            TextField(
              controller: montantController,
              decoration: const InputDecoration(labelText: 'Montant'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: vendeurController,
              decoration: const InputDecoration(labelText: 'Vendeur'),
            ),
            TextField(
              controller: acheteurController,
              decoration: const InputDecoration(labelText: 'Acheteur'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var commande = CommandeModel(
                  id: 0, // ID généré par le serveur
                  title: titleController.text,
                  montant: double.parse(montantController.text),
                  vendeur: vendeurController.text,
                  acheteur: acheteurController.text,
                );
                _controller.addCommande(commande);
                Get.back(); // Retour à la page précédente
              },
              child: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
