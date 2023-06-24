import '../../domain/entity/product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../datasource/remote/product_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl({required this.productDataSource});

  @override
  Future<List<ProductEntity>> getProductList() async {
    try {
      return await productDataSource.getProductList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
