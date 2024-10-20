class UtilisateurNouveauDTO {
  final String? nom;
  final String email;
  final String adresse;
  final String numeroDeTelephone;

  UtilisateurNouveauDTO({
    required this.nom,
    required this.email,
    required this.adresse,
    required this.numeroDeTelephone,
  });

  // Méthode pour convertir depuis le JSON
  factory UtilisateurNouveauDTO.fromJson(Map<String, dynamic> json) {
    return UtilisateurNouveauDTO(
      nom: json['nom'],
      email: json['email'],
      adresse: json['adresse'] ?? 'Adresse non disponible',
      numeroDeTelephone: json['numeroDeTelephone'] ?? 'Numéro non disponible',
    );
  }
}
