class Utilisateur {
  final int id;
  final String nom;
  final String email;
  final String motDePasse;
  final String numeroDeTelephone;
  final String adresse;
  final String grade;
  final String role;
  final String compte; // Remplacez par le type réel de Wallet si nécessaire

  // Constructeur
  Utilisateur({
    required this.id,
    required this.nom,
    required this.email,
    required this.motDePasse,
    required this.numeroDeTelephone,
    required this.adresse,
    required this.grade,
    required this.role,
    required this.compte,
  });

  // Méthode pour créer un Utilisateur à partir d'une Map
  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      id: json['id'],
      nom: json['nom'],
      email: json['email'],
      motDePasse: json['motDePasse'],
      numeroDeTelephone: json['numeroDeTelephone'],
      adresse: json['adresse'],
      grade: json['grade'],
      role: json['role'],
      compte: json['compte'], // Mettez à jour selon le type réel de Wallet
    );
  }

  // Méthode pour convertir un Utilisateur en Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'email': email,
      'motDePasse': motDePasse,
      'numeroDeTelephone': numeroDeTelephone,
      'adresse': adresse,
      'grade': grade,
      'role': role,
      'compte': compte, // Mettez à jour selon le type réel de Wallet
    };
  }
}
