import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_page/search_page.dart';

class SearchScreen extends ConsumerWidget {
  static String routeName = "/searchScreen";

  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showSearch(
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
          );
      },
      child: Icon(Icons.search)),
      body: Container(child: Center(child: Text('Search'))),
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
var people = [
  Person('Mike', 'Barron', 64),
  Person('Todd', 'Black', 30),
  Person('Ahmad', 'Edwards', 55),
  Person('Anthony', 'Johnson', 67),
  Person('Annette', 'Brooks', 39),
];