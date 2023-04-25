part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadInProgress extends ProductState {}

class ProductLoadSuccess extends ProductState {
  final List<ProductModel> productList;

  ProductLoadSuccess(this.productList);

  @override
  List<Object> get props => [productList];
}

class ProductLoadFailure extends ProductState {
  final String message;

  ProductLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
