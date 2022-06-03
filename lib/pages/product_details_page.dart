// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
// import 'package:cider/model/product_details_model.dart';
import 'dart:convert';
import 'package:cider/dao/produt_details_dao.dart';
import 'package:cider/model/product_details_model.dart';
import 'package:cider/model/search/search_model.dart';
import 'package:cider/dao/search_dao.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // 商品名
  var _productName = '';
  // 价格
  var _price = '';

  fetchProductDetails() async {
    try {
      ProductDetailsModel model = await ProductDetails.fetch();
      print('--model---');
      print(model);
      setState(() {
        _productName = model.productName;
        print('123123');
        print(_productName);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    fetchProductDetails();
  }

  Widget build(BuildContext context) {
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
        title: const Text(
          "Hello123",
          style: TextStyle(
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
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 30,
            color: const Color.fromRGBO(229, 207, 157, 1),
            // 头部优惠活动
            child: ProductDetailOffer(),
          ),
          Container(
            // height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            height: 600,
            color: Colors.green,
            child: CarouselWithIndicatorDemo(),
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
            // 商品名和操作按钮
            child: PriceAndButton(
              productName: _productName,
            ),
          ),
          Container(
            // height: 200,
            // color: Colors.blue,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'US\$201',
                    style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            // color: Colors.yellow,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ColorPart(),
          ),
          Container(
            // height: 500,
            // color: Colors.orange,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: SizePart(),
          ),
        ]),
      ),
      bottomNavigationBar: AddToBagButton(),
    );
  }
}

// 头部优惠信息组件
class ProductDetailOffer extends StatefulWidget {
  ProductDetailOffer({Key? key}) : super(key: key);

  @override
  State<ProductDetailOffer> createState() => _ProductDetailOfferState();
}

class _ProductDetailOfferState extends State<ProductDetailOffer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          'Order over \$80 and get a free boho scarf 😄',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// 商品名和操作按钮
class PriceAndButton extends StatelessWidget {
  const PriceAndButton({Key? key, required this.productName}) : super(key: key);

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              productName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.ios_share_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

// 图片部分
final List<String> imgList = [
  'https://cdn.shopify.com/s/files/1/0581/8046/8907/products/GC5A1221_720x.jpg?v=1647960698',
  'https://cdn.shopify.com/s/files/1/0581/8046/8907/products/IMG_1282_720x.jpg?v=1648322362',
  'https://cdn.shopify.com/s/files/1/0581/8046/8907/products/GC5A1227_720x.jpg?v=1648322362',
  'https://cdn.shopify.com/s/files/1/0581/8046/8907/products/GC5A1228_517d70ac-de4a-414a-9f47-a92d76905ae3_720x.jpg?v=1648322362',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            // margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              // borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: const Text(
                        // '111No. ${imgList.indexOf(item)} image123',
                        '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
    .toList();

// 相册组件
class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              // aspectRatio: 16 / 9,
              viewportFraction: 1,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

// 添加到购物车按钮
class AddToBagButton extends StatelessWidget {
  const AddToBagButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              // //设置按下时的背景颜色
              // if (states.contains(MaterialState.pressed)) {
              //   return Colors.blue[200];
              // }
              // //默认不使用背景颜色
              // return null;
              return Color.fromRGBO(238, 226, 221, 1);
            }),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            side: MaterialStateProperty.all(
              BorderSide(color: Colors.black, width: 2),
            ),
            shape: MaterialStateProperty.all(StadiumBorder()),
          ),
          // style: ButtonStyle(
          //   foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //   overlayColor: MaterialStateProperty.resolveWith<Color?>(
          //     (Set<MaterialState> states) {
          //       if (states.contains(MaterialState.hovered))
          //         return Colors.blue.withOpacity(0.04);
          //       if (states.contains(MaterialState.focused) ||
          //           states.contains(MaterialState.pressed))
          //         return Colors.blue.withOpacity(0.12);
          //       return null; // Defer to the widget's default.
          //     },
          //   ),
          // ),
          onPressed: () {
            print('buy it');
          },
          child: const Text(
            'ADD TO BAG',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

// TODO: Size
final List<Widget> sizeList = ['S', 'M', 'L', 'XL']
    .map(
      (f) => InkWell(
        highlightColor: Colors.transparent, // 透明色
        splashColor: Colors.transparent, // 透明色
        onTap: () {
          print('item');
        },
        child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.red,
          //     width: 1,
          //   ),
          //   borderRadius: BorderRadius.circular(20),
          // ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFFFFF00),
              width: 0.5,
            ), // 边色与边宽度
            color: Colors.white, // 底色
            //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
            shape: BoxShape.rectangle, // 默认值也是矩形
            borderRadius: BorderRadius.circular((50.0)), // 圆角度
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(
            f,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          // child: ClipOval(
          //   child: Container(
          //     width: 50,
          //     height: 50,
          //     color: Colors.green,
          //     alignment: Alignment.center,
          //     // margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          //     child: Text(
          //       f,
          //       textAlign: TextAlign.center,
          //       style: const TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
    )
    .toList();

class SizePart extends StatefulWidget {
  SizePart({Key? key}) : super(key: key);

  @override
  State<SizePart> createState() => _SizePartState();
}

class _SizePartState extends State<SizePart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 4),
          child: const Text(
            'Size',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: sizeList,
          ),
        ),
      ],
    );
  }
}

// class SizePart extends StatelessWidget {
//   const SizePart({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       mainAxisSize: MainAxisSize.max,
//       // crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//           child: const Text(
//             'Size',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Container(
//           child: Text('333'),
//         ),
//         Row(
//           children: sizeList,
//         )
//       ],
//     );
//   }
// }

// color part
final List<Widget> colorList = ['Red', 'Blur', 'Sky Blue']
    .map(
      (f) => InkWell(
        highlightColor: Colors.transparent, // 透明色
        splashColor: Colors.transparent, // 透明色
        onTap: () {
          print('item');
        },
        child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.red,
          //     width: 1,
          //   ),
          //   borderRadius: BorderRadius.circular(20),
          // ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFFFFF00),
              width: 0.5,
            ), // 边色与边宽度
            color: Colors.white, // 底色
            //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
            shape: BoxShape.rectangle, // 默认值也是矩形
            borderRadius: BorderRadius.circular((50.0)), // 圆角度
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(
            f,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          // child: ClipOval(
          //   child: Container(
          //     width: 50,
          //     height: 50,
          //     color: Colors.green,
          //     alignment: Alignment.center,
          //     // margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          //     child: Text(
          //       f,
          //       textAlign: TextAlign.center,
          //       style: const TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
    )
    .toList();

class ColorPart extends StatefulWidget {
  ColorPart({Key? key}) : super(key: key);

  @override
  State<ColorPart> createState() => _ColorPartState();
}

class _ColorPartState extends State<ColorPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 4),
          child: const Text(
            'Color',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: colorList,
          ),
        ),
      ],
    );
  }
}
