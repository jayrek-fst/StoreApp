class RatingEntity {
  dynamic rate;
  dynamic count;

  RatingEntity({
    this.rate,
    this.count,
  });

  RatingEntity.fromJson(dynamic json) {
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
    return 'RatingEntity{rate: $rate, count: $count}';
  }
}
