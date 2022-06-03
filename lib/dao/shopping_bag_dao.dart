import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http; //包的别名，避免冲突 使用as
import 'package:cider/model/shopping_bag_model.dart';

const SHPPINGBAG_URL =
    'https://api.shopcider.com/ms/cart/v2/getItemList?shippingCountryId=166&device=Android&platform=Xiaomi&version=1.3.5&deviceId=If7DGLRLMXMaESVGHQ5f-xIijL5qkjaLBsbjn0-jiWA&timestamp=1647939967233&currency=USD&timezone=288000&countryCode=CN&local=zh&lang=en&uid=2758065';

class ShoppingBagDao {
  static Future<ShoppinBagModel> fetch() async {
    final response = await http.get(Uri.parse(SHPPINGBAG_URL));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); //fix中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      print('object===dao');
      print(result);
      return ShoppinBagModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}
