import 'package:telefoni_dashboard/domain/entity/boutique.dart';

class BoutiqueModel {
  final int id;
  final String nom;
  final String popularite;
  final String? adresse;
  final String? telephone;
  final String? email;
  final String? motDePasse;
  final String? photoUrl;
  final String? grade;
  final bool isLocked;
  final String ventes;



  factory BoutiqueModel.fromJson(Map<String, dynamic> json) {
    return BoutiqueModel(
      id: json['id'],
      nom: json['nom'],
      popularite: json['popularite'],
      isLocked: json['isLocked'],
      ventes: json['ventes'],
    );
  }

  BoutiqueModel({required this.id, required this.nom, required this.popularite, this.adresse, this.telephone, this.email, this.motDePasse, this.photoUrl, this.grade, required this.isLocked, required this.ventes});

  // Méthode pour convertir un Utilisateur en Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'popularite': popularite,
      'isLocked': isLocked,
      'ventes': ventes,
    };
  }

  Boutique toEntity() {
    return Boutique(
        id: id,
        nom: nom,
        popularite: popularite,
        isLocked: isLocked,
        ventes: ventes);
  }
}
