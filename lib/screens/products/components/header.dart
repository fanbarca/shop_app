import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/search/search_screan.dart';

import '../../../components/product_card.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';
import '../../home/components/icon_btn_with_counter.dart';


class Header extends StatelessWidget {
  Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBtnWithCounter(
            svgSrc: "assets/icons/arrow_left.svg",
            press: () => Navigator.pop(context),
          ),

        ],
      ),
    );
  }
}
