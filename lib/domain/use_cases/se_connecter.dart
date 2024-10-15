// lib/domain/usecases/connexion_use_case.dart

import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/connexion_entity.dart';
import 'package:telefoni_dashboard/domain/repositories/auth_repository.dart';

class ConnexionUseCase {
  final AuthRepository repository;

  ConnexionUseCase({required this.repository});

  Future<Either<Failure, ConnexionEntity>> execute(
      String email, String motDePasse) async {
    return await repository.login(email, motDePasse);
  }

}
