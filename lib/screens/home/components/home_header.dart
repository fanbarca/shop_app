import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/search/search_screan.dart';

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
        items: people,
        searchLabel: 'Search people',
        searchStyle: TextStyle(color: Theme.of(context).primaryColorDark),
        suggestion: const Center(
          child: Text('Filter people by name, surname or age'),
        ),
        failure: const Center(
          child: Text('No person found :('),
        ),
        filter: (Person person) => [
          person.name,
          person.surname,
          person.age.toString(),
        ],
        sort: (Person a, Person b) => a.compareTo(b),
        builder: (Person person) => ListTile(
          title: Text(person.name),
          subtitle: Text(person.surname),
          trailing: Text('${person.age} yo'),
        ),
      ),
    );
  }
}
