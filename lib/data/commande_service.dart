import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'package:telefoni_dashboard/models/commande_model.dart';
import 'dart:convert';

class CommandeService {
  Future<Either<Failure,List<CommandeModel>>> getCommandes() async {
    final token = await TokenManager.getToken();
    // Envoyer la requête avec le Bearer token dans les en-têtes
    final response = await http.get(
      Uri.parse('$baseUrl/commande'),
      headers: {
        'Authorization': 'Bearer $token', // Ajouter le token ici
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return Right(data.map((commande) => CommandeModel.fromJson(commande)).toList());
    } else {
      return Left(ServerFailure());    }
  }

  Future<Either<Failure, String>> recupererNombreDeCommande() async {
    final token = await TokenManager.getToken();
    // Envoyer la requête avec le Bearer token dans les en-têtes
    final response = await http.get(
      Uri.parse('$baseUrl/commande/total'),
      headers: {
        'Authorization': 'Bearer $token', // Ajouter le token ici
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Right(response.body);
    } else {
      return Left(ServerFailure());
    }
  }
}