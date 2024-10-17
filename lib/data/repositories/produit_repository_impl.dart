import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/datasources/produit_remote_datasource.dart';
import 'package:telefoni_dashboard/domain/entity/telephone.dart';
import 'package:telefoni_dashboard/domain/repositories/produit_repository.dart';

class ProduitRepositoryImpl implements ProduitRepository {
  final ProduitRemoteDatasource produitRemoteDatasource;

  ProduitRepositoryImpl({required this.produitRemoteDatasource});

  @override
  Future<Either<Failure, List<Telephone>>> recureperListeProduits() async {
    try {
      final response = await produitRemoteDatasource.recupererProduits();
      List<Telephone> telephone =
          response.map((model) => model.toEntity()).toList();
      return Right(telephone);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
