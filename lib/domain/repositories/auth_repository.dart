// lib/domain/repositories/connexion_repository.dart

import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/connexion_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, ConnexionEntity>> login(
      String email, String motDePasse);

  Future<Either<Failure, String>> logout();
}
