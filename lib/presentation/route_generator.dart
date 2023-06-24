import 'package:flutter/material.dart';

import '../core/util/constant_util.dart';
import '../domain/entity/product_entity.dart';
import 'ui/screen/dashboard_screen.dart';
import 'ui/screen/product_detail_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case ConstantUtil.routeDashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case ConstantUtil.routeProductDetails:
        return MaterialPageRoute(
          builder: (_) =>
              ProductDetailScreen(productEntity: args as ProductEntity),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: SafeArea(child: Text('Route Error'))),
        );
    }
  }
}
