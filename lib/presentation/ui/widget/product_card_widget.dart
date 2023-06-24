import 'package:flutter/material.dart';
import 'package:store_app/domain/entity/product_entity.dart';

import '../../../core/util/constant_util.dart';
import 'star_rating_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({Key? key, required this.productEntity})
      : super(key: key);

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: MediaQueryData(),
        child: Container(
          color: Colors.grey.shade200,
          margin: EdgeInsets.all(4),
          child: GestureDetector(
            onTap: () {
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(productEntity.image.toString(),
                        fit: BoxFit.cover),
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
                      Text('${ConstantUtil.price} \$${productEntity.price}'),
                      Text(
                          '${ConstantUtil.qty}  ${productEntity.rating?.count}'),
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
