// import 'package:flutter/cupertino.dart';
// import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shamo_app/domain/products/products_response.dart';
import 'package:shamo_app/infrastructure/products/products_repository.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductsResponse>? _product = [];

  List<ProductsResponse> get products => _product!;

  void setProducts(List<ProductsResponse> productsResponse) {
    _product = productsResponse;
    notifyListeners();
  }

  Future<void> getProducts() async {
    final ProductsRepository _productRepository = ProductsRepository();
    try {
      List<ProductsResponse> products = await _productRepository.getProducts();
      _product = products;
    } catch (e) {
      print(e.toString());
    }
  }
}
