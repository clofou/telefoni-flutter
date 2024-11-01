import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/presentation/controllers/commande_controller.dart';
import 'package:telefoni_dashboard/presentation/widgets/search_bar.dart';

class CommandePage extends StatelessWidget {
  CommandePage({super.key});

  final CommandeController commandeController = Get.put(CommandeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (commandeController.isLoadingList.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (commandeController.errorMessageCommandeList.isNotEmpty) {
        return Center(
          child: Text(commandeController.errorMessageCommandeList.value),
        );
      }
      return Column(
        children: [
          MySearchBar(),
          const SizedBox(
            height: 10,
          ),
          _buildTableHeader(),
          Container(
            color: Colors.white,
            height: 500,
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: commandeController.commandes.length,
              itemBuilder: (context, index) {
                final commande = commandeController.commandes[index];
                return _buildTableRow(commande, index);
              },
            ),
          ),
          const SizedBox(height: 20),
          _buildPagination(),
        ],
      );
    });
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('#', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Nom', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Prix', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Acheteur', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Statut', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTableRow(commande, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text((index + 1).toString()),
          Text(commande.nom),
          Text("${commande.prix} CFA"),
          Text(commande.acheteur),
          _buildStatus(commande.statut),
        ],
      ),
    );
  }

  Widget _buildStatus(String statut) {
    Color color;
    String text;

    switch (statut) {
      case 'EN_ATTENTE':
        color = Colors.red;
        text = 'En attente';
        break;
      case 'LIVRER':
        color = Colors.green;
        text = 'Livré';
        break;
      case 'EN_COURS':
        color = Colors.orange;
        text = 'En cours';
        break;
      default:
        color = Colors.black;
        text = 'Inconnu';
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            // Gestion pagination précédente
          },
          icon: const Icon(Icons.arrow_back),
        ),
        const Text('1'), // Exemple pour la pagination
        IconButton(
          onPressed: () {
            // Gestion pagination suivante
          },
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
