import 'package:flutter/material.dart';

import '../../domain/model/product_model.dart';
import '../../util/constant_util.dart';
import 'star_rating_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({Key? key, required this.productModel}) : super(key: key);

  final ProductModel productModel;

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
                arguments: productModel,
              );
            },
            child: Column(
              children: [
                Hero(
                  tag: productModel.id.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(productModel.image.toString(), fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        productModel.title.toString(),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Text('${ConstantUtil.price} \$${productModel.price}'),
                      Text('${ConstantUtil.qty}  ${productModel.rating?.count}'),
                      StarRatingWidget(
                        rating: productModel.rating?.rate,
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
