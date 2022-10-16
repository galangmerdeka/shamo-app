part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductInitial extends ProductsState {}

class ProductLoading extends ProductsState {}

class ProductError extends ProductsState {
  final String errMessage;
  ProductError(this.errMessage);
}

class ProductSuccess extends ProductsState {
  final ProductsResponse productsResponse;
  ProductSuccess(this.productsResponse);
}
