import 'package:flutter/material.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/ui/screen/dashboard_screen.dart';
import 'package:store_app/ui/screen/product_detail_screen.dart';
import 'package:store_app/util/constant_util.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case ConstantUtil.routeDashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case ConstantUtil.routeProductDetails:
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(productModel: args as ProductModel),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: SafeArea(child: Text('Route Error'))),
        );
    }
  }
}
