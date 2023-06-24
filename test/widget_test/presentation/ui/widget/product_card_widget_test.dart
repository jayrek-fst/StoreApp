import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:store_app/core/util/constant_util.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:store_app/data/model/rating_model.dart';
import 'package:store_app/presentation/ui/widget/product_card_widget.dart';

void main() {
  final product = ProductModel(
    id: 001,
    title: 'testTitle',
    price: 10,
    description: 'testDescription',
    category: 'testCategory',
    image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
    rating: RatingModel(rate: 5, count: 100),
  );

  testWidgets('Product card widget has data of the product object',
      (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(ProductCardWidget(productEntity: product));

      final productTitleFinder = find.text(product.title.toString());
      final productPriceFinder =
          find.text('${ConstantUtil.price} \$${product.price.toString()}');
      final productQtyFinder =
          find.text('${ConstantUtil.qty}  ${product.rating?.count}');
      final productRatingFinder = find.byIcon(Icons.star);

      expect(productTitleFinder, findsOneWidget);
      expect(productPriceFinder, findsOneWidget);
      expect(productQtyFinder, findsOneWidget);
      expect(productRatingFinder, findsWidgets);
    });
  });
}
