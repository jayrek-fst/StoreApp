import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:store_app/repository/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/util/constant_util.dart';

import '../../bloc/product/product_bloc.dart';
import '../widget/product_card_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text(ConstantUtil.appName)),
      body: BlocProvider(
        create: (context) => ProductBloc(
          productRepository: ProductRepository(client: http.Client()),
        )..add(ProductFetched()),
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductLoadFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            }
          },
          builder: (context, state) {
            if (state is ProductLoadSuccess) {
              final productList = state.productList;
              return StaggeredGridView.countBuilder(
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                itemCount: productList.length,
                itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: ProductCardWidget(
                    productModel: productList[index],
                  ),
                ),
              );
            }
            if (state is ProductLoadInProgress)
              return Center(
                child: CircularProgressIndicator(),
              );
            return Container();
          },
        ),
      ),
    );
  }
}
