import 'package:dio/dio.dart';
import 'package:rakshak/utils/global.dart';
import 'package:rakshak/utils/locator.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print(err.response.toString() + "skdufhsuyfusi");
    final errorMessage = err.response?.data is List
        ? err.response?.data['message']
        : err.message;
    const message = "Something went wrong";
    locator<GlobalServices>().errorSnackBar(errorMessage ?? message);
    return super.onError(err, handler);
  }
}
