import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'package:telefoni_dashboard/models/boutique_model.dart';
import 'package:http/http.dart' as http;

class BoutiqueRemoteDatasource {
  

  Future<Either<Failure , List<BoutiqueModel>>> recupererListeBoutique() async{
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
      return Right(data.map((annonce) => BoutiqueModel.fromJson(annonce)).toList());
    } else {
      return Left(ServerFailure());
    }
  }

}