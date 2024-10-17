import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/models/card_vente_model.dart';
import 'package:telefoni_dashboard/domain/entity/vente_type.dart';

abstract class VenteRepository {
  Future<Either<Failure, List<VenteType>>> getVentesOccasionVsNeuf();
  Future<Either<Failure, CardVenteModel>> getTotalVentes();
}
