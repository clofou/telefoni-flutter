import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUserData();
}
