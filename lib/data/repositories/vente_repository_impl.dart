import 'package:dartz/dartz.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/datasources/vente_remote_datasource.dart';
import 'package:telefoni_dashboard/data/models/card_vente_model.dart';
import 'package:telefoni_dashboard/domain/entity/vente_type.dart';
import 'package:telefoni_dashboard/domain/repositories/vente_repository.dart';

class VenteRepositoryImpl implements VenteRepository {
  final VenteRemoteDataSource remoteDataSource;

  VenteRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<VenteType>>> getVentesOccasionVsNeuf() async {
    try {
      final response = await remoteDataSource.fetchVentesOccasionVsNeuf();
      List<VenteType> venteType =
          response.map((model) => model.toEntity()).toList();
      return Right(venteType);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, CardVenteModel>> getTotalVentes() async{
    try {
      final response = await remoteDataSource.getTotalVentes();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
