import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cider/model/series_product_model.dart';
import 'package:cider/dao/series_product_dao.dart';
import 'package:cider/model/TestSeriesProductModel.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  // 参考页面间传参，需要获取系列的值，获取商品列表
  // https://flutter.cn/docs/cookbook/navigation/navigate-with-arguments

  String _listTitle = '';

  List _productList = [];
  loadData() async {
    try {
      var model = await SeriesProductDao.fetch();
      print('--series product page---');
      var data = json.decode(model);
      print(data);
      print(data['data']);
      setState(() {
        _productList = data['data']['productList'];
        _listTitle = data['data']['listTitle'];
        print('456456');
        print(_productList);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    // double cardWidth = MediaQuery.of(context).size.width / 3.3;
    // double cardHeight = MediaQuery.of(context).size.height / 3.6;

    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: null,
        ),
        centerTitle: true,
        title: Text(
          _listTitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('go to cart page');
            },
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // childAspectRatio: (itemWidth / itemHeight),
          childAspectRatio: 0.6,
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: _productList.map((value) {
            // TODO: 需要补充点击InkWell
            return InkWell(
              highlightColor: Colors.transparent, // 透明色
              splashColor: Colors.transparent, // 透明色
              onTap: () {
                print('item');
              },
              child: Container(
                // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                color: Colors.white,
                margin: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    Container(
                      height: itemHeight,
                      child: Image.network(
                        value['productStyle'][0]['thumbImage'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                      child: Text(
                        value['productName'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

final List<Widget> colorList =
    ['Red', 'Blue', 'Green', 'Pink', 'Yellow', 'Hot', '123']
        .map(
          (f) => InkWell(
            highlightColor: Colors.transparent, // 透明色
            splashColor: Colors.transparent, // 透明色
            onTap: () {
              print('item');
            },
            child: Column(
              children: [
                Container(
                  child: Image.network(
                      'https://cdn.shopify.com/s/files/1/0581/8046/8907/products/GC5A1221_720x.jpg?v=1647960698',
                      fit: BoxFit.cover),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Text(
                    'this is a very long product name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
