import 'package:store_app/domain/entity/product_entity.dart';
import 'package:store_app/domain/repository/product_repository.dart';

class ProductUseCase {
  final ProductRepository productRepository;

  ProductUseCase({required this.productRepository});

  Future<List<ProductEntity>> getAllProducts() async {
    try {
      return await productRepository.getProductList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}