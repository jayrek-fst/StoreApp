import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/usecase/product_use_case.dart';

import '../../../domain/model/product_model.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUseCase;

  ProductBloc({required this.productUseCase}) : super(ProductInitial()) {
    on<ProductFetched>((event, emit) async {
      emit(ProductLoadInProgress());
      try {
        final products = await productUseCase.getAllProducts();
        emit(ProductLoadSuccess(products));
      } catch (e) {
        emit(ProductLoadFailure(e.toString()));
      }
    });
  }
}
