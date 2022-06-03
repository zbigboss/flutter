import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http; //包的别名，避免冲突 使用as
import 'package:cider/model/home_model.dart';

const HOME_URL =
    'https://api.shopcider.com/ms/content/v2/page/homePage?tid=&device=Android&platform=Xiaomi&version=1.3.5&deviceId=If7DGLRLMXMaESVGHQ5f-xIijL5qkjaLBsbjn0-jiWA&timestamp=1647932891514&currency=USD&timezone=288000&countryCode=CN&local=zh&lang=en&uid=0';

class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(Uri.parse(HOME_URL));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); //fix中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}
