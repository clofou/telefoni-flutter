import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/user.dart';
import 'package:telefoni_dashboard/domain/repositories/user_repository.dart';

class RecuperCurrentUserInfo {
  final UserRepository repository;

  RecuperCurrentUserInfo({required this.repository});

  Future<Either<Failure, User>> execute() async {
    return await repository.getUserData();
  }
}
