import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/datasources/user_remote_datasource.dart';
import 'package:telefoni_dashboard/data/models/user_model.dart';
import 'package:telefoni_dashboard/domain/entity/user.dart';
import 'package:telefoni_dashboard/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, User>> getUserData() async {
    try {
      final UserModel response = await userRemoteDataSource.fetchUserData();
      return Right(
        User(
            nom: response.nom,
            email: response.email,
            photoUrl: response.photoUrl,
            adresse: response.adresse,
            role: response.role,
            telephone: response.telephone),
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
