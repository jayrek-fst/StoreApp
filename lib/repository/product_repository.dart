import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/util/constant_util.dart';

import '../model/product_model.dart';

class ProductRepository {
  final http.Client client;

  ProductRepository({required this.client});

  Future<List<ProductModel>> getProducts() async {
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
