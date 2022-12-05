import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/search/search_screan.dart';

import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Search Icon.svg",
            press: () => search(context),
          ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Cart Icon.svg",
          //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
          // ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }

  void search(context) {
    showSearch(
      context: context,
      delegate: SearchPage(
        // barTheme: ThemeData.light(),
        onQueryUpdate: print,
        items: demoProducts,
        searchLabel: 'Search products',
        searchStyle: TextStyle(color: Theme.of(context).primaryColorDark),
        suggestion: const Center(
          child: Text('Filter products by title or description'),
        ),
        failure: const Center(
          child: Text('No product found :('),
        ),
        filter: (Product product) => [
          product.title,
          product.description,
        ],
        sort: (Product a, Product b) => a.compareTo(b),
        builder: (Product product) => ProductCard.withoutImage(product: product),
      ),
    );
  }
}
