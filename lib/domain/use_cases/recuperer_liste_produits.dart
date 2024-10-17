import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/telephone.dart';
import 'package:telefoni_dashboard/domain/repositories/produit_repository.dart';

class RecupererListeProduits {
  final ProduitRepository repository;

  RecupererListeProduits({required this.repository});

  Future<Either<Failure, List<Telephone>>> execute() {
    return repository.recureperListeProduits();
  }
}
