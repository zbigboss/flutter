import 'package:flutter/material.dart';
import 'package:cider/navigator/tab_navigator.dart';
import 'package:cider/routes/search_page.dart';
import 'package:cider/widget/shopping_bag.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shopcider',
      home: TabNavigator(),
      routes: {
        "search_page": (context) => const SearchPage(),
        "shopping_bag":(context)=>const ShoppingBag()
      },
    );
  }
}
