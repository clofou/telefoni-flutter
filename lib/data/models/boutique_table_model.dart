class BoutiqueTableModel {
  final int rang;
  final String nom;
  final double ventesPourcentageSurTotal;
  bool? isLocked;


  BoutiqueTableModel(
      {required this.rang,
      required this.nom,
      required this.ventesPourcentageSurTotal, this.isLocked});
}
