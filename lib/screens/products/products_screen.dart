import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/components/product_card.dart';

import '../../api/http_service.dart';
import '../../models/product.dart';
import 'components/body.dart';



class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Body(),
    );
  }
}
