import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'package:telefoni_dashboard/data/Dio/dio_client.dart';
import 'package:telefoni_dashboard/models/connexion_model.dart';

class AuthService {
  Dio dio = DioClient().dio;

  Future<Either<Failure, dynamic>> connexion(
      ConnexionModel connexionModel) async {
    final response = await dio.post(
      '$baseUrl/connexion',
      data: connexionModel.toJson(),
    );

    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;

      // Stocker le token dans le sharedPreferences
      await TokenManager.saveToken(data['bearer']);
      return Right(data);
    } else {
      return Left(ServerFailure());
    }
  }

  Future<void> logout() async {
    await TokenManager.deleteToken();
  }
}
