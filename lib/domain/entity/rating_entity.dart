import 'package:equatable/equatable.dart';

class RatingEntity extends Equatable {
  final dynamic rate;
  final dynamic count;

  const RatingEntity({
    this.rate,
    this.count,
  });

  @override
  String toString() {
    return 'RatingEntity{rate: $rate, count: $count}';
  }

  @override
  List<Object?> get props => [rate, count];
}
