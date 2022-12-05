import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/http_service.dart';
import '../../../components/product_card.dart';
import '../../../models/product.dart';

class ProductsGrid extends ConsumerWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AsyncValue<List<Product>> getProducts = ref.watch(getProductsProvider);

    return getProducts.when(data: (data) {
      return GridView.builder(
          shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) =>
            ProductCard(product: data[index]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 250,
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
        ),
      );
    }, error: (o, s) {
      return Center(child: Text('Couldn\'t fetch data'));
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}
