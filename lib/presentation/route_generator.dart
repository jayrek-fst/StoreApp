import 'package:flutter/material.dart';
import 'package:store_app/domain/entity/product_entity.dart';
import 'package:store_app/presentation/ui/screen/dashboard_screen.dart';
import 'package:store_app/presentation/ui/screen/product_detail_screen.dart';

import '../core/util/constant_util.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case ConstantUtil.routeDashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case ConstantUtil.routeProductDetails:
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(productEntity: args as ProductEntity),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: SafeArea(child: Text('Route Error'))),
        );
    }
  }
}
