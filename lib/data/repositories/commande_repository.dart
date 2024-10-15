import 'package:telefoni_dashboard/data/datasources/commande_local_data_source.dart';
import 'package:telefoni_dashboard/data/datasources/commande_remote_data_source.dart';
import '../models/commande_model.dart';

class CommandeRepository {
  final CommandeRemoteDataSource remoteDataSource;
  final CommandeLocalDataSource localDataSource;

  CommandeRepository(this.remoteDataSource, this.localDataSource);

  Future<List<CommandeModel>> getCommandes() async {
    // Récupérer les commandes à partir de la source distante
    return await remoteDataSource.getCommandes();
  }

  Future<void> addCommande(CommandeModel commande) async {
    await remoteDataSource.addCommande(commande);
    localDataSource.cacheCommande(commande); // Optionnel : mettez à jour le cache local
  }
}
