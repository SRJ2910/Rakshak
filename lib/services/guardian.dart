import 'package:dio/dio.dart';
import 'package:rakshak/services/api_v1.dart';

class GuardianService {
  GuardianService();

  Future<Response> getGuardian(String id) async {
    final response = await ApiV1Service.getRequest('/Api/viewGuardian/$id');
    print(response);
    return response;
  }
}
