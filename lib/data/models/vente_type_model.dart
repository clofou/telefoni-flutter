// domain/entities/vente_type.dart
import 'package:telefoni_dashboard/domain/entity/vente_type.dart';

class VenteTypeModel {
  final int mois;
  final int ventesOccasion;
  final int ventesNeuf;

  VenteTypeModel({
    required this.mois,
    required this.ventesOccasion,
    required this.ventesNeuf,
  });

  factory VenteTypeModel.fromJson(Map<String, dynamic> json) {
    return VenteTypeModel(
      mois: json['mois'],
      ventesOccasion: json['ventesOccasion'],
      ventesNeuf: json['ventesNeuf'],
    );
  }

  VenteType toEntity() {
    return VenteType(
        mois: mois, ventesOccasion: ventesOccasion, ventesNeuf: ventesNeuf);
  }
}
