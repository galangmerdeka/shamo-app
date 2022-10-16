import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shamo_app/domain/products/products_response.dart';
import 'package:shamo_app/infrastructure/products/products_repository.dart';

part 'products_state.dart';
// part 'products_cubit.freezed.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductInitial());

  final ProductsRepository _productsRepository = ProductsRepository();
  void getProducts() async {
    emit(ProductLoading());
    // try {
    //   final data = await _productsRepository.getProducts();
    //   data.fold(
    //     (l) => ProductError(l),
    //     (r) => ProductSuccess(r),
    //   );
    // } catch (e) {
    //   emit(ProductError(e.toString()));
    // }
  }
}
