import 'package:flutter/material.dart';
import 'package:telefoni_dashboard/data/models/commande_model.dart';

class CommandeCard extends StatelessWidget {
  final CommandeModel commande;

  const CommandeCard({super.key, required this.commande});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(commande.title),
        subtitle: Text(
            'Montant: ${commande.montant} €\nVendeur: ${commande.vendeur}\nAcheteur: ${commande.acheteur}'),
      ),
    );
  }
}
