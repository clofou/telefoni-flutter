class Commande {
  final int id;
  final String title;
  final double montant;
  final String vendeur;
  final String acheteur;

  Commande({
    required this.id,
    required this.title,
    required this.montant,
    required this.vendeur,
    required this.acheteur,
  });
}
