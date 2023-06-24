import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_app/core/util/constant_util.dart';
import 'package:store_app/data/datasource/remote/product_datasource.dart';
import 'package:store_app/data/datasource/remote/product_datasource_impl.dart';
import 'package:store_app/domain/entity/product_entity.dart';

import 'product_datasource_impl_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late ProductDataSource productDataSource;

  setUp(() {
    mockClient = MockClient();
    productDataSource = ProductDataSourceImpl(client: mockClient);
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

    expect(
        await productDataSource.getProductList(), isA<List<ProductEntity>>());
  });

  test('throws exception', () async {
    when(
      mockClient.get(Uri.parse('${ConstantUtil.baseUrl}products')),
    ).thenThrow(Exception());

    expect(productDataSource.getProductList(), throwsException);
  });
}
