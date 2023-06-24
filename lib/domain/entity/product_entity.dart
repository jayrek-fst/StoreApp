import 'package:equatable/equatable.dart';

import '../../data/model/rating_model.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? title;
  final dynamic price;
  final String? description;
  final String? category;
  final String? image;
  final RatingModel? rating;

  const ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        rating,
      ];

  @override
  String toString() {
    return 'ProductEntity{id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating}';
  }
}
