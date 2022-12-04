import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/components/product_card.dart';

import '../../api/http_service.dart';
import '../../models/Product.dart';

final httpServiceProvider = Provider((ref) {
  return HttpService();
});

final getProductsProvider = FutureProvider<List<Product>>((ref) {
  return ref.watch(httpServiceProvider).getMockProducts();
  // return ref.watch(httpServiceProvider).getProducts();
});

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Product>> getProducts = ref.watch(getProductsProvider);

    return Scaffold(
      body: SafeArea(
        child: getProducts.when(data: (data) {
          List<Product> products = data;
          return SizedBox(
            // height: MediaQuery.of(context).size.height - 310,
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              // scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 300,
                  crossAxisCount: 2,
                  // crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
              ),
            ),
          );
        }, error: (o, s) {
          return Center(child: Text('Couldn\'t fetch data'));
        }, loading: () {
          return Center(child: CircularProgressIndicator());
        }),
      ),
      // body: FutureBuilder(
      //   future: httpService.getProducts(),
      //   builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
      //     if (snapshot.hasData) {
      //       List<Product> products = snapshot.data ?? [];
      //       return SizedBox(
      //         height: MediaQuery.of(context).size.height - 310,
      //         child: ListView.builder(
      //           itemCount: products.length,
      //           itemBuilder: (context, index) {
      //             return ProductCard(product: products[index]);
      //           },
      //         ),
      //       );
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}
