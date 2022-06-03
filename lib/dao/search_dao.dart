import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http; //包的别名，避免冲突 使用as
// import 'package:dio/dio.dart';
import 'package:cider/model/search/search_model.dart';

const SEARCH_URL =
    'https://api.shopcider.com/ms/product/v1/config/searchHotWord?device=Android&platform=Xiaomi&version=1.3.5&deviceId=If7DGLRLMXMaESVGHQ5f-xIijL5qkjaLBsbjn0-jiWA&timestamp=1647937259840&currency=USD&timezone=288000&countryCode=CN&local=zh&lang=en&uid=0';

class SearchDao {
  static Future<SearchModel> fetch() async {
    final response = await http.get(Uri.parse(SEARCH_URL));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return SearchModel.fromJson(result);
    } else {
      throw Exception('Failed to load search_page.json');
    }
  }
}
