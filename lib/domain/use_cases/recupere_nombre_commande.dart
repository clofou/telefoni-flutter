import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/repositories/commande_repository.dart';

class RecupereNombreCommande {
  final CommandeRepository repository;

  RecupereNombreCommande({required this.repository});

  Future<Either<Failure, String>> execute() async {
    return await repository.recupererNombreDeCommande();
  }
}
