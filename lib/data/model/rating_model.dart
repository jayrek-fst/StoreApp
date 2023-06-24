import '../../domain/entity/rating_entity.dart';

class RatingModel extends RatingEntity {
  const RatingModel({
    required super.rate,
    required super.count,
  });

  factory RatingModel.fromJson(dynamic json) {
    return RatingModel(
      rate: json['rate'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = rate;
    map['count'] = count;
    return map;
  }

  @override
  String toString() {
    return 'RatingModel{rate: $rate, count: $count}';
  }
}
