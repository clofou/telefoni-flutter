import 'package:http/http.dart' as http;
import 'package:telefoni_dashboard/data/models/commande_model.dart';
import 'dart:convert';


class CommandeRemoteDataSource {
  final String baseUrl;

  CommandeRemoteDataSource(this.baseUrl);

  Future<List<CommandeModel>> getCommandes() async {
    final response = await http.get(Uri.parse('$baseUrl/client'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((commande) => CommandeModel.fromJson(commande)).toList();
    } else {
      throw Exception('Failed to load commandes');
    }
  }

  Future<void> addCommande(CommandeModel commande) async {
    final response = await http.post(
      Uri.parse('$baseUrl/commandes'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(commande.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add commande');
    }
  }
}
