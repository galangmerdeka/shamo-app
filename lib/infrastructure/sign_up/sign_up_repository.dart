import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shamo_app/domain/sign_up/sign_up_request.dart';
import 'package:shamo_app/domain/sign_up/sign_up_response.dart';
import 'package:shamo_app/utils/constant.dart';

class SignUpRepository {
  Dio _dio = new Dio();

  Future<Either<String, SignUpResponse>> signUpUser(
      SignUpRequest signUpRequest) async {
    Response response;
    var formData = FormData.fromMap(signUpRequest.toJson());
    try {
      response = await _dio.post(BASE_URL + "register", data: formData);
      SignUpResponse _signUpResponse =
          SignUpResponse.fromJson(response.data['data']);
      print(_signUpResponse);
      return right(_signUpResponse);
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
