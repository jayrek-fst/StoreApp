import 'package:store_app/domain/entity/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProductList();
}
