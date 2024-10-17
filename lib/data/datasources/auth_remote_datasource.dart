import 'package:http/http.dart' as http;
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'dart:convert';
import 'package:telefoni_dashboard/data/models/connexion_model.dart';

class AuthRemoteDataSource {
  Future<ConnexionModel> connexion(ConnexionModel connexionModel) async {
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
      return connexionResponse;
    } else {
      throw Exception('Impossible de se Connecter');
    }
  }
}
