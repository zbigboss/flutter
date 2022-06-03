class CommonModel {
  final String? categoryName;
  final String? imgUrl;
  final int? isShow;
  final String? linkUrl;
  final String? showType;
  final int? sort;

  CommonModel({
    this.categoryName,
    this.imgUrl,
    this.isShow,
    this.linkUrl,
    this.showType,
    this.sort,
  });
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      categoryName: json['categoryName'],
      imgUrl: json['imgUrl'],
      isShow: json['isShow'],
      linkUrl: json['linkUrl'],
      showType: json['showType'],
      sort: json['sort'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryName'] = categoryName;
    data['imgUrl'] = imgUrl;
    data['isShow'] = isShow;
    data['linkUrl'] = linkUrl;
    data['showType'] = showType;
    data['sort'] = sort;
    return data;
  }
}
