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
      },
      child: Icon(Icons.search)),
      body: Container(child: Center(child: Text('Search'))),
    );
  }
}
