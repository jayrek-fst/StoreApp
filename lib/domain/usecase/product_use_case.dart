import 'package:store_app/domain/model/product_model.dart';
import 'package:store_app/domain/repository/product_repository.dart';

class ProductUseCase {
  final ProductRepository productRepository;

  ProductUseCase({required this.productRepository});

  Future<List<ProductModel>> getAllProducts() async {
    try {
      return await productRepository.getProductList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
