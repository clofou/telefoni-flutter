// data/datasources/remote/vente_remote_data_source.dart
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'package:telefoni_dashboard/models/card_vente_model.dart';
import 'dart:convert';

import 'package:telefoni_dashboard/models/vente_type_model.dart';

class VenteRemoteDataSource {
  Future<Either<Failure, List<VenteTypeModel>>> fetchVentesOccasionVsNeuf() async {
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
      return Right(data.map((ventes) => VenteTypeModel.fromJson(ventes)).toList());
    } else {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, dynamic>> getTotalVentes() async {
    final token = await TokenManager.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/transaction/total-montant-ventes'),
      headers: {
        'Authorization': 'Bearer $token', // Ajouter le token ici
        'Content-Type': 'application/json',
      },
    );

    final data = json.decode(response.body);
    final connexionResponse = CardVenteModel.fromJson(data);

    if (response.statusCode == 200) {
      return Right(connexionResponse);
    } else {
      return Left(ServerFailure());
    }
  }
}
