class BannerModel {
  final double? height;
  final String? linkUrl;
  final String? showUrl;
  final int? sort;
  final double? width;

  BannerModel({
    this.height,
    this.linkUrl,
    this.showUrl,
    this.sort,
    this.width,
  });
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      height: json['height'],
      linkUrl: json['linkUrl'],
      showUrl: json['showUrl'],
      sort: json['sort'],
      width: json['width'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['linkUrl'] = this.linkUrl;
    data['showUrl'] = this.showUrl;
    data['sort'] = this.sort;
    data['width'] = this.width;
    return data;
  }
}
