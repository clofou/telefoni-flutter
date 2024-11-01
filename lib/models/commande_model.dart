class CommandeModel {
final int id;
  final String nom;
  final double prix;
  final String statut;
  final String acheteur;

  CommandeModel({required this.id, required this.nom, required this.prix, required this.statut, required this.acheteur});


  // Factory method for JSON deserialization
  factory CommandeModel.fromJson(Map<String, dynamic> json) {
    return CommandeModel(
      id: json['id'],
      nom: json['nom'],
      prix: json['prix'],
      statut: json['statut'],
      acheteur: json['acheteur'],
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'statut': statut,
      'prix': prix,
      'acheteur': acheteur,
    };
  }

}
