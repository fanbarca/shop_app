import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/screens/home_navigation/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/search/search_screan.dart';

import '../../size_config.dart';
import '../products/products_screen.dart';
import '../profile/profile_screen.dart';

final currentNavBarIndexProvider = StateProvider<MenuState>((ref) {
  return MenuState.home;
});

class HomeNavigation extends ConsumerWidget {
  static String routeName = "/homeNavigation";

  @override
  Widget build(BuildContext context, ref) {
    SizeConfig().init(context);

    MenuState selectedNavBarItem = ref.watch(currentNavBarIndexProvider);

    return WillPopScope(
      onWillPop: () async {
        if (selectedNavBarItem != MenuState.home) {
          ref.read(currentNavBarIndexProvider.notifier).state = MenuState.home;
          return Future.value();
        } else {
          final value = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const Text('Are you sure you want to exit?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    TextButton(
                      child: const Text('Yes, exit'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              });
          return value == true;
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          // appBar: AppBar(
          //     title: Text(
          //       selectedNavBarItem.name,
          //       style: TextStyle(color: Colors.purple),
          //     ),
          //     centerTitle: true),
          body: IndexedStack(
            index: selectedNavBarItem.index,
            children: [
              HomeScreen(),
              Container(child: Center(child: Text('Favourites'))),
              CartScreen(),
              ProfileScreen(),
              // ProductsScreen(),
            ],
          ),
          bottomNavigationBar: CustomBottomNavBar(),
        ),
      ),
    );
  }
}
