import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app/bloc/product/product_bloc.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/repository/product_repository.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late ProductBloc productBloc;
  late MockProductRepository mockProductRepository;

  final product = ProductModel(
    id: 001,
    title: 'testTitle',
    price: 10,
    description: 'testDescription',
    category: 'testCategory',
    image: 'testImage',
    rating: null,
  );

  setUp(() {
    mockProductRepository = MockProductRepository();
    productBloc = ProductBloc(productRepository: mockProductRepository);
  });

  blocTest(
    'emits ProductLoadInProgress state and ProductLoadSuccess state when getProducts returns products',
    build: () => productBloc,
    setUp: () async {
      when(() => mockProductRepository.getProducts()).thenAnswer(
        (_) => Future.value([product]),
      );
    },
    verify: (_) {
      verify(() => mockProductRepository.getProducts()).called(1);
    },
    act: (bloc) => bloc..add(ProductFetched()),
    expect: () => [isA<ProductLoadInProgress>(), isA<ProductLoadSuccess>()],
  );

  blocTest(
    'emits ProductLoadInProgress state and ProductLoadFailure state when getProducts throws exception',
    build: () => productBloc,
    setUp: () async {
      when(() => mockProductRepository.getProducts()).thenThrow(Exception);
    },
    verify: (_) {
      verify(() => mockProductRepository.getProducts()).called(1);
    },
    act: (bloc) => bloc..add(ProductFetched()),
    expect: () => [isA<ProductLoadInProgress>(), isA<ProductLoadFailure>()],
  );
}
