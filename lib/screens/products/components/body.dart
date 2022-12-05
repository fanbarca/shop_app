import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/http_service.dart';
import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'header.dart';
import 'products_grid.dart';


class Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {

    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Header(),
            SizedBox(height: getProportionateScreenHeight(20)),
            ProductsGrid(),
          ],
        ),
      ),
    );
  }
}
