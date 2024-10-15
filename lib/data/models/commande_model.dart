class CommandeModel {
  final int id;
  final String title;
  final double montant;
  final String vendeur;
  final String acheteur;

  CommandeModel({
    required this.id,
    required this.title,
    required this.montant,
    required this.vendeur,
    required this.acheteur,
  });

  // Factory method for JSON deserialization
  factory CommandeModel.fromJson(Map<String, dynamic> json) {
    return CommandeModel(
      id: json['id'],
      title: json['title'],
      montant: json['montant'],
      vendeur: json['vendeur'],
      acheteur: json['acheteur'],
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'montant': montant,
      'vendeur': vendeur,
      'acheteur': acheteur,
    };
  }
}
