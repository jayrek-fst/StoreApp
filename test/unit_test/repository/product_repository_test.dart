import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/repository/product_repository.dart';
import 'package:store_app/util/constant_util.dart';

import 'product_repository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late ProductRepository productRepository;

  setUp(() {
    mockClient = MockClient();
    productRepository = ProductRepository(client: mockClient);
  });

  test('returns a list of products when status code is 200', () async {
    when(
      mockClient.get(Uri.parse('${ConstantUtil.baseUrl}products')),
    ).thenAnswer((_) async => http.Response(
          '[{'
          '"id": 1,"title": "test product title 1",'
          '"price": 100.50,'
          '"description": "test product description 1",'
          '"category": "test category","image": '
          '"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",'
          '"rating": {"rate": 3.9, "count": 120}'
          '}]',
          200,
        ));

    expect(await productRepository.getProducts(), isA<List<ProductModel>>());
  });

  test('throws exception', () async {
    when(
      mockClient.get(Uri.parse('${ConstantUtil.baseUrl}products')),
    ).thenThrow(Exception());

    expect(productRepository.getProducts(), throwsException);
  });
}
