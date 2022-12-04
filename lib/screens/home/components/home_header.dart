import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({
    Key? key,
  }) : super(key: key);

  var people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
  ];

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
            press: () => showSearch(
              context: context,
              delegate: SearchPage(
                onQueryUpdate: print,
                items: people,
                searchLabel: 'Search people',
                suggestion: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: const Center(
                    child: Text('Filter people by name, surname or age'),
                  ),
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
            ),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
class Person implements Comparable<Person> {
  final String name, surname;
  final num age;

  const Person(this.name, this.surname, this.age);

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}