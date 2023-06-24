import '../../domain/entity/product_entity.dart';
import 'rating_model.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.title,
    super.price,
    super.description,
    super.category,
    super.image,
    super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating:
          json['rating'] != null ? RatingModel.fromJson(json['rating']) : null,
    );
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
