import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http; //包的别名，避免冲突 使用as
import 'package:dio/dio.dart';
import 'package:cider/model/series_product_model.dart';
import 'package:cider/model/TestSeriesProductModel.dart';

const SEARCH_URL =
    'https://m.shopcider.com/from-mall-store/ms/product/v1/list/shortList?uid=0&local=en&lang=en&timestamp=1648881650769&version=2.0.1&device=Web&deviceId=8337333f-6179-4e2f-a469-3efe382d0e29&country=US&currency=USD&timeZone=28800&logTime=1648852850769&accessToken=a5bbf7f01d853534618eb728d90c3715&env=production&clientIp=65.49.206.172&collectionId=1998&page=1&size=1&tid=1';

class SeriesProductDao {
  static Future fetch() async {
    try {
      var response = await Dio().get(SEARCH_URL);
      print('---dio data---');
      print('1');
      print(response);
      print('2');
      print(response.data);
      print('3');
      // print(TestSeriesProductModel.fromJson(response.toString()));
      print(json.encode(TestSeriesProductModel.fromJson(response.data)));
      return json.encode(TestSeriesProductModel.fromJson(response.data));
    } catch (e) {
      print('---error---');
      print(e);
    }
    // final response = await http.get(Uri.parse(SEARCH_URL));
    // if (response.statusCode == 200) {
    //   print('123123');
    //   print(response.body);
    //   print(response.statusCode);
    //   var result = jsonDecode(response.body);
    //   print(result);
    //   print('---this is data---');
    //   print(result['data']);
    //   return SeriesProductModel.fromJson(result['data']);
    // } else {
    //   throw Exception('Failed to load search_page.json');
    // }
  }
}

// class SeriesProductDao {
//   void fetch() async {
//     try {
//       var response = await Dio().get(SEARCH_URL);
//       print('---dio data---');
//       print(response);
//     } catch (e) {
//       print('---error---');
//       print(e);
//     }
//   }
// }
