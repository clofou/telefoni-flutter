import 'package:telefoni_dashboard/data/models/commande_model.dart';


class CommandeLocalDataSource {
  final List<CommandeModel> _cache = [];

  List<CommandeModel> getCachedCommandes() {
    return _cache;
  }

  void cacheCommande(CommandeModel commande) {
    _cache.add(commande);
  }
}
