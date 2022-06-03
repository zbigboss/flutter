//购物车页面
import 'dart:convert';
import 'dart:math';
import 'package:cider/dao/shopping_bag_dao.dart';
import 'package:cider/main.dart';
import 'package:cider/model/product_model.dart';
import 'package:cider/model/shopping_bag_model.dart';
import 'package:flutter/material.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({Key? key}) : super(key: key);

  @override
  _ShoppingBag createState() => _ShoppingBag();
}

class _ShoppingBag extends State<ShoppingBag> {
  List<ProductModel> shoppingBagListList = [];

  String resultString = '';
  loadData() async {
    try {
      ShoppinBagModel model = await ShoppingBagDao.fetch();
      setState(() {
        shoppingBagListList = model.shoppingBagList;
        resultString = json.encode(model.shoppingBagList);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // ignore: unnecessary_new
        appBar: new AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Container(
            child: const Text(
              'Shopping Bag',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(5, 22, 0, 0),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: _itemProduct(context),
        ));
  }

  _itemProduct(BuildContext context) {
    if (shoppingBagListList == null) {
      return [];
    }
    List<Widget> items = [];
    for (var i = 0; i < shoppingBagListList.length; i++) {
      final data = shoppingBagListList[i] as ProductModel;
      print('-3232-23-23');
      print(data);
      items.add(
        Container(
          height: 120,
          width: 70,
          margin: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                child: Image.network(data.productPic!),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 30.0,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  data.productCategory!,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              Container(
                                width: 30,
                                child: Icon(Icons.delete_outline),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 30.0,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            data.salePrice!,
                            style: TextStyle(color: Colors.red, fontSize: 12.0),
                          ),
                        ),
                        Container(
                            height: 30.0,
                            padding: EdgeInsets.fromLTRB(10, 1, 0, 1),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              //设置四周圆角 角度
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            // color: Colors.grey.shade500,
                            alignment: Alignment.centerLeft,
                            child: Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Floral Printed Cami Dress',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  child: Icon(Icons.keyboard_arrow_down),
                                )
                              ],
                            ))),
                        Container(
                            height: 30.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 24.0,
                                  width: 24.0,
                                  child: IconButton(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.all(0.0),
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.teal,
                                    onPressed: () {
                                      print('减');
                                    },
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
                                    iconSize: 24.0,
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(data.itemNum.toString())),
                                IconButton(
                                  onPressed: () {
                                    print('加');
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.teal,
                                  alignment: Alignment.centerLeft,
                                  padding: new EdgeInsets.all(0.0),
                                  icon: const Icon(Icons.add_circle_outline),
                                  iconSize: 24.0,
                                )
                              ],
                            ))
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
    }
    return items;
  }
}
