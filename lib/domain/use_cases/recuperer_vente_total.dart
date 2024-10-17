import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/models/card_vente_model.dart';
import 'package:telefoni_dashboard/domain/repositories/vente_repository.dart';

class RecupererVenteTotal {
  final VenteRepository repository;

  RecupererVenteTotal({required this.repository});

  Future<Either<Failure, CardVenteModel>> execute() async{
    return await repository.getTotalVentes();
  }
}
