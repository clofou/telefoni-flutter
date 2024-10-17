import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/telephone.dart';

abstract class ProduitRepository {
  Future<Either<Failure, List<Telephone>>> recureperListeProduits();
}
