import 'package:flutter/material.dart';
import 'package:store_app/domain/entity/product_entity.dart';

import '../widget/star_rating_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.productEntity})
      : super(key: key);

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              margin: EdgeInsets.all(4),
              child: Column(
                children: [
                  Hero(
                    tag: productEntity.id.toString(),
                    child: Image.network(
                      productEntity.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          productEntity.title.toString(),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Text('price: \$${productEntity.price}'),
                        Text('qty: ${productEntity.rating?.count}'),
                        StarRatingWidget(
                          rating: productEntity.rating?.rate,
                          onRatingChanged: (_) {},
                          color: Colors.yellow.shade900,
                        ),
                        // Text('rate: ${productList[index].rating?.rate}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.add_shopping_cart_outlined),
                  SizedBox(width: 10),
                  Text('ADD TO CART'),
                ]),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green.shade700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
