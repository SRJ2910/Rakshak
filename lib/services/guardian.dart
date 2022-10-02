import 'package:dio/dio.dart';
import 'package:rakshak/services/api_v1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuardianService {
  GuardianService();

  Future<Response> getGuardian(String id) async {
    final response = await ApiV1Service.getRequest('/Api/viewGuardian/$id');
    // print(response);
    return response;
  }

  Future<Response> addGuardian(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString("User_id");
    final response = await ApiV1Service.postRequest(
      '/Api/addGuardian/$id',
      data: Map<String, dynamic>.from({
        "phone": phone,
      }),
    );
    return response;
  }
}
