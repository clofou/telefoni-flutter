import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'package:telefoni_dashboard/data/models/user_model.dart';

class UserRemoteDataSource {
  // Future to fetch user data with Bearer Token from local storage
  Future<UserModel> fetchUserData() async {
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
      return userResponse;
    } else if (response.statusCode == 401) {
      // Le token a peut-être expiré, déconnexion de l'utilisateur
      throw Exception('Token expired, please log in again.');
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
