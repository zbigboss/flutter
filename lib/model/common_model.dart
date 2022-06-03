class CommonModel {
  final double? height;
  final String? linkUrl;
  final String? mainTitle;
  final String? showUrl;
  final int? sort;
  final double? width;

  CommonModel(
      {this.height,
      this.linkUrl,
      this.mainTitle,
      this.showUrl,
      this.sort,
      this.width});
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
        height: json['height'],
        linkUrl: json['linkUrl'],
        mainTitle: json['mainTitle'],
        showUrl: json['showUrl'],
        sort: json['sort'],
        width: json['width']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['linkUrl'] = this.linkUrl;
    data['mainTitle'] = this.mainTitle;
    data['showUrl'] = this.showUrl;
    data['sort'] = this.sort;
    data['width'] = this.width;
    return data;
  }
}
