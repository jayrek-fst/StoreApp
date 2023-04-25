import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/util/constant_util.dart';
// import 'package:store_app/cubit/product_list/product_cubit.dart';

import 'bloc/product/product_bloc.dart';
import 'repository/product_repository.dart';
import 'package:http/http.dart' as http;

import 'route_generator.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductRepository(client: http.Client()),
      child: MaterialApp(
        title: ConstantUtil.appName,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: ConstantUtil.routeDashboard,
      ),
    );
  }
}
