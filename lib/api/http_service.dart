import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:shop_app/models/Product.dart';


final httpServiceProvider = Provider((ref) {
  return HttpService();
});

final getProductsProvider = FutureProvider.autoDispose<List<Product>>((ref) {
  // return ref.watch(httpServiceProvider).getMockProducts();
  return ref.watch(httpServiceProvider).getProducts();
});


class HttpService {
  final String URL = "https://myshop.free.beeceptor.com/products";

  Future<List<Product>> getProducts() async {
    Response res = await get(Uri.parse(URL));

    if (res.statusCode == 200) {
      final Map<String, dynamic> map = jsonDecode(res.body);

      List<Product> products = [];
      map.forEach((key, value) => products.add(Product.fromJson(value)));

      return products;
    } else {
      throw "Unable to retrieve products.";
    }
  }

  Future<List<Product>> getMockProducts() async {
    await Future.delayed(Duration(seconds: 5));
    return demoProducts;
  }
}
