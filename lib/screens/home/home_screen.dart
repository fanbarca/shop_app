import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/screens/home_navigation/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';

import '../home_navigation/home_navigation.dart';
import 'components/body.dart';




class HomeScreen extends ConsumerWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context, ref) {
    // var selectedNavBarItem = ref.watch(currentNavBarIndexProvider);

    return Scaffold(
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
