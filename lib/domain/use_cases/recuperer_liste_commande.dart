import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/commande.dart';
import 'package:telefoni_dashboard/domain/repositories/commande_repository.dart';

class RecupererListeCommande {
  final CommandeRepository repository;

  RecupererListeCommande({required this.repository});

  Future<Either<Failure, List<Commande>>> execute() async{
    return await repository.recupererListeDeCommandes();
  }
}
