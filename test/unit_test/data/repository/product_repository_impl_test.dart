import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app/data/datasource/remote/product_datasource.dart';

import 'package:store_app/data/model/product_model.dart';
import 'package:store_app/data/repository/product_repository_impl.dart';
import 'package:store_app/domain/repository/product_repository.dart';

class MockProductDataSource extends Mock implements ProductDataSource {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late MockProductDataSource mockProductDataSource;
  late ProductRepository productRepository;

  setUp(() {
    mockProductDataSource = MockProductDataSource();
    productRepository =
        ProductRepositoryImpl(productDataSource: mockProductDataSource);
  });

  final product = ProductModel(
    id: 001,
    title: 'testTitle',
    price: 10,
    description: 'testDescription',
    category: 'testCategory',
    image: 'testImage',
    rating: null,
  );

  test('returns a list of products', () async {
    when(() => mockProductDataSource.getProductList()).thenAnswer(
      (_) => Future.value([product]),
    );

    final response = await productRepository.getProductList();
    expect(response[0].title, product.title);
    expect(response[0].description, product.description);
    expect(response[0].category, product.category);
    expect(response[0].image, product.image);
  });

  test('throws exception', () async {
    when(() => mockProductDataSource.getProductList()).thenThrow(Exception());
    expect(productRepository.getProductList(), throwsException);
  });
}
