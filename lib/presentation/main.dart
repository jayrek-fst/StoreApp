import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../core/util/constant_util.dart';
import '../data/datasource/remote/product_datasource_impl.dart';
import 'route_generator.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductDataSourceImpl(client: http.Client()),
      child: MaterialApp(
        title: ConstantUtil.appName,
        theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Poppins'),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: ConstantUtil.routeDashboard,
      ),
    );
  }
}
