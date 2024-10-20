import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/repositories/user_repository.dart';

class RecupereNouveauxUtilisateurs {
  final UserRepository repository;

  RecupereNouveauxUtilisateurs({required this.repository});

  Future<Either<Failure,Map<String, dynamic>>> execute() async {
    return await repository.getNouveauxUtilisateursAvecPourcentage();
  }
}
