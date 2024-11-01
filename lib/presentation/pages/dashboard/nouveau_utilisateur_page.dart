import 'package:flutter/material.dart';
import 'package:telefoni_dashboard/models/utilisateur_nouveau_dto.dart';

class NouveauxUtilisateursPage extends StatelessWidget {
  final List<UtilisateurNouveauDTO> utilisateurs;
  final double pourcentageVariation;

  const NouveauxUtilisateursPage({
    super.key,
    required this.utilisateurs,
    required this.pourcentageVariation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveaux Utilisateurs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Variation: $pourcentageVariation%",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: utilisateurs.length,
                itemBuilder: (context, index) {
                  final utilisateur = utilisateurs[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(utilisateur.email),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nom: ${utilisateur.nom ?? "Non disponible"}"),
                          Text("Adresse: ${utilisateur.adresse}"),
                          Text("Téléphone: ${utilisateur.numeroDeTelephone}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
