import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app/domain/entity/product_entity.dart';
import 'package:store_app/domain/usecase/product_use_case.dart';
import 'package:store_app/presentation/bloc/product/product_bloc.dart';

class MockProductUseCase extends Mock implements ProductUseCase {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late ProductBloc productBloc;

  late MockProductUseCase mockProductUseCase;

  const products = ProductEntity(
    id: 001,
    title: 'testTitle',
    price: 10,
    description: 'testDescription',
    category: 'testCategory',
    image: 'testImage',
    rating: null,
  );

  setUp(() {
    mockProductUseCase = MockProductUseCase();
    productBloc = ProductBloc(productUseCase: mockProductUseCase);
  });

  blocTest(
    'emits ProductLoadInProgress state and ProductLoadSuccess state when getProducts returns products',
    build: () => productBloc,
    setUp: () {
      when(() => unawaited(mockProductUseCase.getAllProducts())).thenAnswer(
        (_) => Future.value([products]),
      );
    },
    verify: (_) {
      verify(() => unawaited(mockProductUseCase.getAllProducts())).called(1);
    },
    act: (bloc) => bloc..add(ProductFetched()),
    expect: () => [isA<ProductLoadInProgress>(), isA<ProductLoadSuccess>()],
  );

  blocTest(
    'emits ProductLoadInProgress state and ProductLoadFailure state when getProducts throws exception',
    build: () => productBloc,
    setUp: () {
      when(() => unawaited(mockProductUseCase.getAllProducts()))
          .thenThrow(Exception);
    },
    verify: (_) {
      verify(() => unawaited(mockProductUseCase.getAllProducts())).called(1);
    },
    act: (bloc) => bloc..add(ProductFetched()),
    expect: () => [isA<ProductLoadInProgress>(), isA<ProductLoadFailure>()],
  );
}
