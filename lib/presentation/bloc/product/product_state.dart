part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadInProgress extends ProductState {}

class ProductLoadSuccess extends ProductState {
  final List<ProductEntity> productList;

  const ProductLoadSuccess(this.productList);

  @override
  List<Object> get props => [productList];
}

class ProductLoadFailure extends ProductState {
  final String message;

  const ProductLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
