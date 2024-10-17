import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/domain/entity/commande.dart';

abstract class CommandeRepository {
  Future<Either<Failure, String>> recupererNombreDeCommande();
  Future<Either <Failure, List<Commande>> > recupererListeDeCommandes();
}
