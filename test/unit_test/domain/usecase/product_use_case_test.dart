import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app/domain/entity/product_entity.dart';
import 'package:store_app/domain/repository/product_repository.dart';
import 'package:store_app/domain/usecase/product_use_case.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ProductUseCase productUseCase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    productUseCase = ProductUseCase(productRepository: mockProductRepository);
  });

  final product = ProductEntity(
    id: 001,
    title: 'testTitle',
    price: 10,
    description: 'testDescription',
    category: 'testCategory',
    image: 'testImage',
    rating: null,
  );

  test('returns a list of products', () async {
    when(() => mockProductRepository.getProductList()).thenAnswer(
      (_) => Future.value([product]),
    );

    final response = await productUseCase.getAllProducts();
    expect(response[0].title, product.title);
    expect(response[0].description, product.description);
    expect(response[0].category, product.category);
    expect(response[0].image, product.image);
  });

  test('throws exception', () async {
    when(() => mockProductRepository.getProductList()).thenThrow(Exception());
    expect(productUseCase.getAllProducts(), throwsException);
  });
}
