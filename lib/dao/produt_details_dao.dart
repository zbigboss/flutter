import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http; //包的别名，避免冲突 使用as
// import 'package:dio/dio.dart';
import 'package:cider/model/product_details_model.dart';
import 'package:dio/dio.dart';

// const PRODUCT_DETAILS_URL =
//     'https://m.shopcider.com/from-mall-store/ms/product/v1/info/productDetail';

const PRODUCT_DETAILS_URL =
    'https://m.shopcider.com/from-mall-store/ms/product/v1/info/productDetail?uid=0&local=en&lang=en&timestamp=1648532683847&version=2.0.0&device=Web&deviceId=8337333f-6179-4e2f-a469-3efe382d0e29&country=US&currency=USD&adsChannel=%7B%7D&timeZone=28800&logTime=1648503883847&buyUid=&accessToken=a5bbf7f01d853534618eb728d90c3715&env=production&pid=1014640';

class ProductDetails {
  static Future<ProductDetailsModel> fetch() async {
    final response = await http.get(Uri.parse(PRODUCT_DETAILS_URL));
    print('search rresponse');
    print(response);
    print('search body');
    print(response.body);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return ProductDetailsModel.fromJson(result);
    } else {
      throw Exception('Failed to load search_page.json');
    }
  }
}
