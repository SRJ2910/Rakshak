import 'package:dio/dio.dart';
import 'package:rakshak/model/sos_message.dart';
import 'package:rakshak/services/api_v1.dart';

class SosMessageService {
  SosMessageService();

  Future<Response> updateSosMessage(String id, SosMessage message) async {
    final response = await ApiV1Service.putRequest(
      '/Api/editcustomtext/$id',
      data: message.toMap(),
    );
    return response;
  }
}