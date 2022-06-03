class ProductDetailsModel {
  final int isFavor;
  final String productName;

  const ProductDetailsModel({
    required this.isFavor,
    required this.productName,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      isFavor: json['data']['isFavor'],
      productName: json['data']['productName'],
    );
  }
}
