import 'package:dio/dio.dart';
import 'package:telefoni_dashboard/core/utils/token_manager.dart';


class DioClient {
  // Instance privée de Dio
  static final DioClient _instance = DioClient._internal();
  late final Dio dio;

  // Constructeur interne
  DioClient._internal() {
    dio = _createDio();
  }

  // Factory pour retourner l'instance unique
  factory DioClient() {
    return _instance;
  }

  Dio _createDio() {
    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Récupérer le token stocké
        String? token = await TokenManager.getToken();
        if (token != null) {
          // Ajouter le Bearer token à l'en-tête Authorization
          options.headers['Authorization'] = 'Bearer $token';
        }

        return handler.next(options);
      },
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
         //TODO:SE DECCONECTER Si Session expire
        }
        return handler.next(e);
      },
    ));

    return dio;
  }
}
