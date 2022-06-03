// "cartId": 18350592,
// "isStock": 1,
// "itemNum": 1,
// "moduleTitle": 0,
// "originMathPrice": 4.00,
// "originalPrice": "",
// "originalPriceNum": 4.00,
// "productCategory": "Earrings",
// "productId": 1014153,
// "productName": "6pcs Colorful Butterfly Shaped Hair Claw",
// "productPic": "https://img1.shopcider.com/product/1646795063000-3Z6ykX.jpg",
// "productStyleName": "Multicolor",
// "promotionMathPrice": 4.00,
// "saleMathPrice": 4.00,
// "salePrice": "US$4.00",
// "salePriceNum": 4.00,
// "skuCode": "CD2022021962150ER-Multicolor-One Size",
// "skuId": 60439,
// "skuStyleName": "One Size",
// "spuCode": "CD2022021962150ER"
class ProductModel {
  int? cartId;
  int? isStock;
  int? itemNum;
  int? moduleTitle;
  double? originMathPrice;
  String? originalPrice;
  double? originalPriceNum;
  String? productCategory;
  int? productId;
  String? productName;
  String? productPic;
  String? productStyleName;
  double? promotionMathPrice;
  double? saleMathPrice;
  String? salePrice;
  double? salePriceNum;
  String? skuCode;
  int? skuId;
  String? skuStyleName;
  String? spuCode;

  ProductModel(
      {this.cartId,
      this.isStock,
      this.itemNum,
      this.moduleTitle,
      this.originMathPrice,
      this.originalPrice,
      this.originalPriceNum,
      this.productCategory,
      this.productId,
      this.productName,
      this.productPic,
      this.productStyleName,
      this.promotionMathPrice,
      this.saleMathPrice,
      this.salePrice,
      this.salePriceNum,
      this.skuCode,
      this.skuId,
      this.skuStyleName,
      this.spuCode});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        cartId: json['cartId'],
        isStock: json['isStock'],
        itemNum: json['itemNum'],
        moduleTitle: json['moduleTitle'],
        originMathPrice: json['originMathPrice'],
        originalPrice: json['originalPrice'],
        originalPriceNum: json['originalPriceNum'],
        productCategory: json['productCategory'],
        productId: json['productId'],
        productName: json['productName'],
        productPic: json['productPic'],
        productStyleName: json['productStyleName'],
        promotionMathPrice: json['promotionMathPrice'],
        saleMathPrice: json['saleMathPrice'],
        salePrice: json['salePrice'],
        salePriceNum: json['salePriceNum'],
        skuCode: json['skuCode'],
        skuId: json['skuId'],
        skuStyleName: json['skuStyleName'],
        spuCode: json['spuCode']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartId'] = this.cartId;
    data['isStock'] = this.isStock;
    data['itemNum'] = this.itemNum;
    data['moduleTitle'] = this.moduleTitle;
    data['originMathPrice'] = this.originMathPrice;
    data['originalPrice'] = this.originalPrice;
    data['originalPriceNum'] = this.originalPriceNum;
    data['productCategory'] = this.productCategory;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productPic'] = this.productPic;
    data['productStyleName'] = this.productStyleName;
    data['promotionMathPrice'] = this.promotionMathPrice;
    data['saleMathPrice'] = this.saleMathPrice;
    data['salePrice'] = this.salePrice;
    data['salePriceNum'] = this.salePriceNum;
    data['skuCode'] = this.skuCode;
    data['skuId'] = this.skuId;
    data['skuStyleName'] = this.skuStyleName;
    data['spuCode'] = this.spuCode;
    return data;
  }
}
