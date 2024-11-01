import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'package:telefoni_dashboard/models/user_model.dart';
import 'package:telefoni_dashboard/models/utilisateur_nouveau_dto.dart';

class UserService {
  // Future to fetch user data with Bearer Token from local storage
  Future<Either<Failure, UserModel>> fetchUserData() async {
    // Récupérer le Bearer token stocké

    final token = await TokenManager.getToken();
    // Envoyer la requête avec le Bearer token dans les en-têtes
    final response = await http.get(
      Uri.parse('$baseUrl/user/current'),
      headers: {
        'Authorization': 'Bearer $token', // Ajouter le token ici
        'Content-Type': 'application/json',
      },
    );

    final userResponse = UserModel.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return Right(userResponse);
    } else if (response.statusCode == 401) {
      // Le token a peut-être expiré, déconnexion de l'utilisateur
      throw Exception('Token expired, please log in again.');
    } else {
      return Left(ServerFailure());
    }
  }

  // Méthode pour récupérer les utilisateurs et le pourcentage de variation
  Future<Either<Failure, Map<String, dynamic>>> getNouveauxUtilisateursAvecPourcentage() async {
    final token = await TokenManager.getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/client/new'), // Utilise le bon endpoint
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> utilisateursJson = data['utilisateurs'];
      double pourcentageVariation = data['pourcentageVariation'];

      List<UtilisateurNouveauDTO> utilisateurs = utilisateursJson
          .map((utilisateur) => UtilisateurNouveauDTO.fromJson(utilisateur))
          .toList();
      print({
        'utilisateurs': utilisateurs,
        'pourcentageVariation': pourcentageVariation,
      });

      return Right({
        'utilisateurs': utilisateurs,
        'pourcentageVariation': pourcentageVariation,
      });
    } else {
      return Left(ServerFailure());
    }
  }
}
