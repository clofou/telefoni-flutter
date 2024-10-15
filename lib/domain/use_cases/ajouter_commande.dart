import 'package:telefoni_dashboard/data/models/commande_model.dart';
import 'package:telefoni_dashboard/data/repositories/commande_repository.dart';


class AjouterCommande {
  final CommandeRepository repository;

  AjouterCommande(this.repository);

  Future<void> call(CommandeModel commande) async {
    await repository.addCommande(commande);
  }
}
