import 'package:http/http.dart' as http;
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';
import 'package:telefoni_dashboard/data/models/commande_model.dart';
import 'dart:convert';

class CommandeRemoteDataSource {
  Future<List<CommandeModel>> getCommandes() async {
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
      return data.map((commande) => CommandeModel.fromJson(commande)).toList();
    } else {
      throw Exception('Failed to load commandes');
    }
  }

  Future<String> recupererNombreDeCommande() async {
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
      return response.body;
    } else {
      throw Exception('Impossible de recuperer le total de commande');
    }
  }
}
