// data/datasources/remote/vente_remote_data_source.dart
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'dart:convert';

class VenteService {
  Future<Either<Failure, List<dynamic>>> fetchVentesOccasionVsNeuf() async {
    final token = await TokenManager.getToken();
    // Envoyer la requête avec le Bearer token dans les en-têtes
    final response = await http.get(
      Uri.parse('$baseUrl/statistiques/ventes-occasion-vs-neuf'),
      headers: {
        'Authorization': 'Bearer $token', // Ajouter le token ici
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return Right(data);
    } else {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, dynamic>> getTotalVentes() async {
    final token = await TokenManager.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/admin/vente/total'),
      headers: {
        'Authorization': 'Bearer $token', // Ajouter le token ici
        'Content-Type': 'application/json',
      },
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      return Right(data);
    } else {
      return Left(ServerFailure());
    }
  }

}
