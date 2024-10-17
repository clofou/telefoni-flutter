import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/datasources/commande_remote_data_source.dart';
import 'package:telefoni_dashboard/domain/entity/commande.dart';
import 'package:telefoni_dashboard/domain/repositories/commande_repository.dart';

class CommandeRepositoryImpl implements CommandeRepository {
  final CommandeRemoteDataSource commandeRemoteDataSource;

  CommandeRepositoryImpl({required this.commandeRemoteDataSource});

  @override
  Future<Either<Failure, List<Commande>>> recupererListeDeCommandes() async {
    try {
      final response = await commandeRemoteDataSource.getCommandes();
      List<Commande> commandes =
          response.map((model) => model.toEntity()).toList();
      return Right(commandes);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> recupererNombreDeCommande() async {
    try {
      final response =
          await commandeRemoteDataSource.recupererNombreDeCommande();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
