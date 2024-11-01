class UserModel {
  final String? nom;
  final String? email;
  final String? adresse;
  final String? role;
  final String? photoUrl;
  final String? telephone;

  UserModel(
      {required this.nom,
      required this.email,
      required this.adresse,
      required this.role,
      required this.photoUrl,
      required this.telephone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        nom: json['nom'],
        email: json['email'],
        adresse: json['adresse'],
        role: json['role'],
        photoUrl: json['photoUrl'],
        telephone: json['telephone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'email': email,
      'adresse': adresse,
      'role': role,
      'photoUrl': photoUrl,
      'telephone': telephone
    };
  }
}
