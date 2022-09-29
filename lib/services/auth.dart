import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rakshak/model/signupinput.dart';
import 'package:rakshak/services/api_v1.dart';
import 'package:rakshak/utils/const.dart';
import 'package:rakshak/utils/global.dart';
import 'package:rakshak/utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  const AuthService();

  ///
  /// Send login request
  Future<bool> signUpRequest(SignUpInput input) async {
    final response = await ApiV1Service.postRequest(
      '/Api/signup',
      data: input.toMap(),
    );
    if ((response.statusCode ?? 400) > 300) {
      return false;
    }
    print(response.statusCode);
    print(response.data['_id']);
    await saveCookie(response);
    return true;
  }

  /// Save cookies after sign in/up
  Future<void> saveCookie(Response response) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("User_Name", response.data['name']);
    prefs.setString("User_phone", response.data['phone']);
    prefs.setString("User_id", response.data['_id']);

    List<Cookie> cookies = [Cookie("userId", response.data['_id'])];
    final cj = await ApiV1Service.getCookieJar();
    await cj.saveFromResponse(Uri.parse(constant.apiUrl), cookies);
  }

  ///
  Future<void> signOut() async {
    await clearCookies();
    // await FirebaseAuth.instance.signOut();
  }

  /// Clear cookies before log out
  Future<void> clearCookies() async {
    final cj = await ApiV1Service.getCookieJar();
    await cj.deleteAll();
  }

  /// Send sign in request
  ///
  Future<bool> signInRequest(SignUpInput input) async {
    print(input.email);
    print(input.password);
    final response = await ApiV1Service.postRequest(
      '/Api/signin',
      data: {
        'email': input.email,
        'password': input.password,
      },
    );
    if ((response.statusCode ?? 400) > 300) {
      locator<GlobalServices>().errorSnackBar("Invalid Credentials");
      return false;
    }
    print(response.statusCode);
    print(response.toString());
    await saveCookie(response);
    return true;
  }

  ///password change request
  ///
  Future<bool> PasswordChangeRequest(
      String oldPassword, String newPassword, String confirmPassword) async {
    final response = await ApiV1Service.putRequest(
      '/password/update',
      data: {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      },
    );
    if ((response.statusCode ?? 400) > 300) {
      return false;
    }
    return true;
  }

  ///password change request
  ///
  Future<bool> ForgotPasswordChangeRequest(
      String newPassword, String confirmPassword, String phoneNumber) async {
    // print(newPassword + " " + confirmPassword + " " + phoneNumber);
    final response = await ApiV1Service.putRequest(
      '/password/reset',
      data: {
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
        'phoneNumber': phoneNumber,
      },
    );
    if ((response.statusCode ?? 400) > 300) {
      return false;
    }
    return true;
  }
}
