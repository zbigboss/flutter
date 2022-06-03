import 'package:cider/model/product_model.dart';

class ShoppinBagModel {
  final List<ProductModel> shoppingBagList;

  ShoppinBagModel({
    required this.shoppingBagList,
  });

  factory ShoppinBagModel.fromJson(Map<String, dynamic> json) {
    var jsonData = json['data']['cartItemList'][0]['productList'];
    var shoppingBagListJson = [];
    shoppingBagListJson = jsonData as List;
    List<ProductModel> shoppingBagList =
        shoppingBagListJson.map((i) => ProductModel.fromJson(i)).toList();

    return ShoppinBagModel(
      shoppingBagList: shoppingBagList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shoppingBagList != null) {
      data['shoppingBagList'] =
          this.shoppingBagList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
