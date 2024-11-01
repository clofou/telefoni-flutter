class TelephoneModel {
  final int id;
  final String nom;
  final String prix;
  final String etat;
  final String vendeur;
  final String statut;

  TelephoneModel(
      {required this.id,
      required this.nom,
      required this.prix,
      required this.etat,
      required this.vendeur,
      required this.statut});

  factory TelephoneModel.fromJson(Map<String, dynamic> json) {
    return TelephoneModel(
      id: json['id'],
      nom: json['nom'],
      prix: json['prix'],
      etat: json['etat'],
      vendeur: json['vendeur'],
      statut: json['statut'],
    );
  }

  // Méthode pour convertir un Utilisateur en Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prix': prix,
      'etat': etat,
      'vendeur': vendeur,
      'statut': statut,
    };
  }
}
