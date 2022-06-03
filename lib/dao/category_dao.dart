import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http; //包的别名，避免冲突 使用as
import 'package:cider/model/category/category_model.dart';

const CATEGORY_URL =
    'https://api.shopcider.com/ms/product/v1/category/list?device=Android&platform=Xiaomi&version=1.3.5&deviceId=If7DGLRLMXMaESVGHQ5f-xIijL5qkjaLBsbjn0-jiWA&timestamp=1647934406330&currency=USD&timezone=288000&countryCode=CN&local=zh&lang=en&uid=0';

class CategoryDao {
  static Future<CategoryModel> fetch() async {
    final response = await http.get(Uri.parse(CATEGORY_URL));
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return CategoryModel.fromJson(result);
    } else {
      throw Exception('Failed to load category_page.json');
    }
  }
}
