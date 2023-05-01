class RatingModel {
  dynamic rate;
  dynamic count;

  RatingModel({
    this.rate,
    this.count,
  });

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
