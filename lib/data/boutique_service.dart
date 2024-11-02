import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/Dio/dio_client.dart';

class BoutiqueService {
  Dio dio = DioClient().dio;

  Future<Either<Failure, List<dynamic>>> recupererListeBoutique() async {
    Response response = await dio.get('$baseUrl/admin/boutique/liste');

    if (response.statusCode == 200) {
      final body = response.data;
      print(body);
      return Right(body);
    } else {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, dynamic>> ajouterBoutique(
      Map<String, dynamic> boutique) async {
    Response response = await dio.post('$baseUrl/admin/boutique/ajout',
        data: boutique);

    if (response.statusCode == 200) {
      final body = response.data;
      print(body);
      return Right(body);
    } else {
      return Left(ServerFailure());
    }
  }
}
