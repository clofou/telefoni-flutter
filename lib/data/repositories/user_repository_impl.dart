import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/datasources/user_remote_datasource.dart';
import 'package:telefoni_dashboard/domain/entity/user.dart';
import 'package:telefoni_dashboard/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, User>> getUserData() async {
    try {
      final response = await userRemoteDataSource.fetchUserData();
      User user = User(
          nom: response.nom,
          email: response.email,
          photoUrl: response.photoUrl,
          adresse: response.adresse,
          role: response.role,
          telephone: response.telephone);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
