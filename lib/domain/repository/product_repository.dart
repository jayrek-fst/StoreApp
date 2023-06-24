import '../entity/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProductList();
}
