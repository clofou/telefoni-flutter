import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'package:telefoni_dashboard/models/connexion_model.dart';
import 'package:http/http.dart' as http;

class AuthService {

  Future<Either<Failure, ConnexionModel>> connexion(ConnexionModel connexionModel) async {
    final response = await http.post(
      Uri.parse('$baseUrl/connexion'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(connexionModel.toJson()),
    );

    if (response.statusCode == 200) {
      // Si la connexion est réussie, extraire les données
      final data = json.decode(response.body);
      final connexionResponse = ConnexionModel.fromJson(data);

      // Stocker le token dans SharedPreferences
      await TokenManager.saveToken(connexionResponse.bearer!);
      return Right(connexionResponse);
    } else {
      return Left(ServerFailure());
    }
  }


  Future<void> logout() async {
    await TokenManager.deleteToken();
  }
  
}