// lib/data/repositories/connexion_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/datasources/auth_local_datasource.dart';
import 'package:telefoni_dashboard/data/datasources/auth_remote_datasource.dart';
import 'package:telefoni_dashboard/data/models/connexion_model.dart';
import 'package:telefoni_dashboard/domain/entity/connexion_entity.dart';
import 'package:telefoni_dashboard/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDatasource authLocalDatasource;

  AuthRepositoryImpl(this.authLocalDatasource,
      {required this.remoteDataSource});

  @override
  Future<Either<Failure, ConnexionEntity>> login(
      String email, String motDePasse) async {
    try {
      final connexionModel =
          ConnexionModel(email: email, motDePasse: motDePasse);
      final response = await remoteDataSource.connexion(connexionModel);

      // On convertit le ConnexionModel en ConnexionEntity ici
      final connexionEntity = ConnexionEntity(
        nom: response.nom ?? '',
        role: response.role ?? '',
        token: response.bearer ?? '',
      );

      return Right(
          connexionEntity); // En cas de succès, retourner un Right avec l'entity
    } catch (e) {
      // En cas d'erreur, retourner un Left avec un échec
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    // Supprimer le token localement
    try {
      await authLocalDatasource.logout();
      return const Right("Succès");
    } catch (e) {
      return Left(CacheFailure());
    }

    // Ici, vous pouvez aussi envoyer une requête à l'API pour révoquer le token si nécessaire
  }
}
