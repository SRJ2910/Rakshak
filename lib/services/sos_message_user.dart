import 'package:dio/dio.dart';
import 'package:rakshak/model/sos_message.dart';
import 'package:rakshak/services/api_v1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SosMessageService {
  SosMessageService();

  /// Set the SOS message for the user
  Future<Response> updateSosMessage(String id, SosMessage message) async {
    final response = await ApiV1Service.putRequest(
      '/Api/editcustomtext/$id',
      data: message.toMap(),
    );
    return response;
  }

  /// get sos history messages
  Future<Response> getHistory(String id) async {
    final response = await ApiV1Service.getRequest('/Api/soshistory/$id');
    return response;
  }

  /// send sos messages
  Future<Response> sendSos() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString("User_id");
    final response = await ApiV1Service.postRequest('/Api/sendsos/$id');
    return response;
  }
}
