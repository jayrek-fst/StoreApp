import 'package:store_app/domain/model/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProductList();
}
