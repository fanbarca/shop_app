import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

import '../../../constants.dart';
import '../../../enums.dart';
import '../home_navigation.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var selectedNavBarItem = ref.watch(currentNavBarIndexProvider);

    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: selectedNavBarItem == MenuState.home
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  ref.read(currentNavBarIndexProvider.notifier).state =
                      MenuState.home;
                  // Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Heart Icon.svg",
                  color: selectedNavBarItem == MenuState.favourite
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  ref.read(currentNavBarIndexProvider.notifier).state =
                      MenuState.favourite;
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Cart Icon.svg",
                  color: selectedNavBarItem == MenuState.cart
                      ? kPrimaryColor
                      : inActiveIconColor,
                  height: 24,
                ),
                onPressed: () {
                  ref.read(currentNavBarIndexProvider.notifier).state =
                      MenuState.cart;
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: selectedNavBarItem == MenuState.profile
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  ref.read(currentNavBarIndexProvider.notifier).state =
                      MenuState.profile;
                  // Navigator.pushNamed(context, ProfileScreen.routeName);
                },
              ),

            ],
          )),
    );
  }
}
