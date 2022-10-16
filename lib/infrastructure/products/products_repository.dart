import 'dart:convert';

// import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shamo_app/domain/products/products_response.dart';
import 'package:shamo_app/utils/constant.dart';

class ProductsRepository {
  Dio _dio = Dio();

  Future<List<ProductsResponse>> getProducts() async {
    Response response;
    response = await _dio.get(BASE_URL + "products");
    print("response ${response.data['data']['data']}");
    if (response.statusCode == 200) {
      print("get data success !!");
      List data = response.data['data']['data'];
      List<ProductsResponse> products = [];
      for (var item in data) {
        products.add(ProductsResponse.fromJson(item));
      }
      return products;
    } else {
      throw Exception("Failed Fetching Data Products");
    }

    // ProductsResponse _productResponse =
    //     ProductsResponse.fromJson(response.data['data']['data']);
    // print(_productResponse);
    // List<ProductsResponse> _products = [];
    // _products.add(_productResponse);
    // return _products;
  }
}
