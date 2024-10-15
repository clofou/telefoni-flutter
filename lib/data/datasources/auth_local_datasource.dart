import 'package:telefoni_dashboard/core/utils/token_manager.dart';

class AuthLocalDatasource {
  Future<void> logout() async {
    await TokenManager.deleteToken();
  }
}
