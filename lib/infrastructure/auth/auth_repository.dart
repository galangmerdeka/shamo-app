// import 'dart:js';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shamo_app/domain/auth/model/login_request.dart';
import 'package:shamo_app/domain/auth/model/login_response.dart';
// import 'package:shamo_app/model/user.dart';
import 'package:shamo_app/utils/constant.dart';

class AuthRepository {
  Dio _dio = new Dio();
  final _storage = new FlutterSecureStorage();

  Future<Either<String, LoginResponse>> signInUser(
      LoginRequest loginRequest) async {
    Response response;
    String access_token = '';
    var formData = FormData.fromMap(loginRequest.toJson());
    try {
      response = await _dio.post(BASE_URL + "login", data: formData);
      LoginResponse _loginResponse =
          LoginResponse.fromJson(response.data['data']);
      access_token = response.data['data']['access_token'];
      await _storage.write(key: 'token', value: access_token);
      // print(_loginResponse);
      print(await _storage.read(key: 'token'));
      return right(_loginResponse);
    } on DioError catch (e) {
      print("http_response_code : ${e.response!.statusCode}");
      String errMessage = e.response!.data.toString();
      switch (e.type) {
        case DioErrorType.response:
          errMessage = e.response!.data['data']['message'];
          break;
        default:
      }
      return left(errMessage);
    }
  }
}
