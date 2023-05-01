import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_app/presentation/ui/widget/star_rating_widget.dart';

void main() {
  testWidgets('StarRatingWidget displays a full star icon and a half star icon', (tester) async {
    await tester.pumpWidget(StarRatingWidget(
      rating: 1.5,
      color: Colors.yellow,
    ));

    expect(find.byIcon(Icons.star_half), findsWidgets);
    expect(find.byIcon(Icons.star), findsOneWidget);
  });

  testWidgets('StarRatingWidget displays 4 full star icon and a border star icon', (tester) async {
    await tester.pumpWidget(StarRatingWidget(
      rating: 4,
      color: Colors.yellow,
    ));

    expect(find.byIcon(Icons.star_border), findsOneWidget);
    expect(find.byIcon(Icons.star), findsWidgets);
  });

  testWidgets('StarRatingWidget displays 5 full stars rating', (tester) async {
    await tester.pumpWidget(StarRatingWidget(
      rating: 5,
      color: Colors.yellow,
    ));

    expect(find.byIcon(Icons.star), findsWidgets);
  });
}
