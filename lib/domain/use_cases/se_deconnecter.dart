import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/repositories/auth_repository.dart';

class SeDeconnecterUseCase {
  final AuthRepository repository;

  SeDeconnecterUseCase({required this.repository});

  Future<Either<Failure, String>> execute() async {
    return await repository.logout();
  }
}
