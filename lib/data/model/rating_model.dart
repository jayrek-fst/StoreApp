import 'package:store_app/domain/entity/rating_entity.dart';

class RatingModel extends RatingEntity {
  RatingModel({
    required dynamic rate,
    required dynamic count,
  }) : super(rate: rate, count: count);

  RatingModel.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
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
