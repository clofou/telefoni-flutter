class CardVenteModel {
  final double pourcentageVariation;
  final double totalMontantVentes;

  CardVenteModel(
      {required this.pourcentageVariation, required this.totalMontantVentes});

  factory CardVenteModel.fromJson(Map<String, dynamic> json) {
    return CardVenteModel(
        pourcentageVariation: json['pourcentageVariation'],
        totalMontantVentes: json['totalMontantVentes']);
  }
}
