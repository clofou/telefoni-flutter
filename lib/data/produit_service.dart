import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'package:http/http.dart' as http;
import 'package:telefoni_dashboard/models/telephone_model.dart';

class ProduitService {
  Future<Either<Failure, List<dynamic>>> recupererProduits() async {
    final token = await TokenManager.getToken();
    // Envoyer la requête avec le Bearer token dans les en-têtes
    final response = await http.get(
      Uri.parse('$baseUrl/annonce/admin'),
      headers: {
        'Authorization': 'Bearer $token', // Ajouter le token ici
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return Right(data.map((annonce) => TelephoneModel.fromJson(annonce)).toList());
    } else {
      return Left(ServerFailure());
    }
  }
}
