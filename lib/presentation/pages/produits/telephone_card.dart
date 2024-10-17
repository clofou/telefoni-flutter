import 'package:flutter/material.dart';
import 'package:telefoni_dashboard/domain/entity/telephone.dart';

class TelephoneCard extends StatelessWidget {
  final Telephone telephone;

  const TelephoneCard({
    super.key,
    required this.telephone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: const BeveledRectangleBorder(),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  telephone.nom,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "${telephone.prix} CFA",
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(telephone.vendeur),
                    const SizedBox(width: 5),
                    telephone.etat == "NEUF"
                        ? const Icon(Icons.store, color: Colors.green)
                        : const Icon(Icons.store, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  telephone.etat,
                  style: TextStyle(
                      color: telephone.etat == "NEUF"
                          ? Colors.green
                          : Colors.orange),
                ),
                Text(
                  telephone.statut,
                  style: TextStyle(
                      color: telephone.statut == "Vendu"
                          ? Colors.green
                          : Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
