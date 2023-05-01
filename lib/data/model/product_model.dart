import 'package:store_app/domain/entity/product_entity.dart';

import 'rating_model.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    int? id,
    String? title,
    dynamic price,
    String? description,
    String? category,
    String? image,
    RatingModel? rating,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          image: image,
          rating: rating,
        );

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? RatingModel.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating?.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating}';
  }
}
