import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/model/product_model.dart';
import '../../../presentation/util/constant_util.dart';
import 'product_datasource.dart';

class ProductDataSourceImpl implements ProductDataSource {
  final http.Client client;

  ProductDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProductList() async {
    try {
      var response = await client.get(Uri.parse('${ConstantUtil.baseUrl}products'));
      final responseBody = jsonDecode(response.body);
      List<ProductModel> products = (responseBody as List)
          .map(
            (product) => ProductModel.fromJson(product),
          )
          .toList();
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
