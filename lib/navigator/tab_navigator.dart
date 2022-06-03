import 'package:flutter/material.dart';
import 'package:cider/pages/home_page.dart';
import 'package:cider/pages/category_page.dart';
import 'package:cider/pages/wishlist_page.dart';
import 'package:cider/pages/my_page.dart';
import 'package:cider/pages/product_details_page.dart';
import 'package:cider/pages/series_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.black;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          CategoryPage(),
          // WishlistPage(),
          // FIXME: 临时展示，商品详情 页面
          ProductDetailsPage(),
          // FIXME: 临时展示，系列页面
          SeriesPage(),
          // MyPage(),
        ],
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: _activeColor,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem('Home', Icons.home, 0),
          _bottomItem('Category', Icons.manage_search_outlined, 1),
          _bottomItem('Wishlist', Icons.favorite_border, 2),
          _bottomItem('Me', Icons.face, 3),
        ],
      ),
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _onTap(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: _defaultColor),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        label: title);
  }
}
