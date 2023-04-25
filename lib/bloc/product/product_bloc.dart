import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product_model.dart';
import '../../repository/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<ProductFetched>((event, emit) async {
      emit(ProductLoadInProgress());
      try {
        final products = await productRepository.getProducts();
        emit(ProductLoadSuccess(products));
      } catch (e) {
        emit(ProductLoadFailure(e.toString()));
      }
    });
  }

//  fetchProductList() async {
//   emit(ProductListStarted());
//   try {
//     final products = await productRepository.getProducts();
//     emit(ProductListLoaded(products));
//   } catch (e) {
//     emit(ExceptionOccurred(e.toString()));
//   }
// }
}
