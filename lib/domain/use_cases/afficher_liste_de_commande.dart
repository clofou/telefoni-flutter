import 'package:telefoni_dashboard/data/models/commande_model.dart';
import 'package:telefoni_dashboard/data/repositories/commande_repository.dart';


class AfficherListeDeCommandes {
  final CommandeRepository repository;

  AfficherListeDeCommandes(this.repository);

  Future<List<CommandeModel>> call() async {
    return await repository.getCommandes();
  }
}
