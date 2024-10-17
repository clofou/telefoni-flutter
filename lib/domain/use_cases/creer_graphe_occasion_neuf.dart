import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/vente_type.dart';
import 'package:telefoni_dashboard/domain/repositories/vente_repository.dart';

class GetVentesOccasionVsNeuf {
  final VenteRepository repository;

  GetVentesOccasionVsNeuf(this.repository);

  Future<Either<Failure,List<VenteType>>> call() {
    return repository.getVentesOccasionVsNeuf();
  }
}