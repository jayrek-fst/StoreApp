import 'package:store_app/domain/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProductList();
}
