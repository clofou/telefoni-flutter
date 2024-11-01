class ConnexionModel {
  final String? email;
  final String? motDePasse;
  final String? role;
  final String? bearer;
  final String? nom;

  ConnexionModel(
      {this.email, this.motDePasse, this.role, this.bearer, this.nom});

  // Méthode pour créer un Utilisateur à partir d'une Map
  factory ConnexionModel.fromJson(Map<String, dynamic> json) {
    return ConnexionModel(
      nom: json['nom'],
      role: json['role'],
      bearer: json['bearer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'motDePasse': motDePasse, // Ajouter mot de passe si nécessaire
    };
  }
}
