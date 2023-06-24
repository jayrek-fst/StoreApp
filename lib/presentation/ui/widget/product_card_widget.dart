import 'package:flutter/material.dart';

import '../../../core/util/constant_util.dart';
import '../../../domain/entity/product_entity.dart';
import 'star_rating_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Container(
          color: Colors.grey.shade200,
          margin: const EdgeInsets.all(4),
          child: GestureDetector(
            onTap: () async {
              Navigator.of(context).pushNamed(
                ConstantUtil.routeProductDetails,
                arguments: productEntity,
              );
            },
            child: Column(
              children: [
                Hero(
                  tag: productEntity.id.toString(),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(
                      productEntity.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        productEntity.title.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      Text('${ConstantUtil.price} \$${productEntity.price}'),
                      Text(
                        '${ConstantUtil.qty}  ${productEntity.rating?.count}',
                      ),
                      StarRatingWidget(
                        rating: productEntity.rating?.rate,
                        color: Colors.yellow.shade900,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
