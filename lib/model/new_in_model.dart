class NewInModel {
  final String? seeMore;
  final String? linkUrl;
  final String? mainTitle;
  final int? sort;
  final String? subTitle;

  NewInModel({
    this.seeMore,
    this.linkUrl,
    this.mainTitle,
    this.sort,
    this.subTitle,
  });
  factory NewInModel.fromJson(Map<String, dynamic> json) {
    return NewInModel(
      seeMore: json['seeMore'],
      linkUrl: json['linkUrl'],
      mainTitle: json['mainTitle'],
      sort: json['sort'],
      subTitle: json['subTitle'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seeMore'] = this.seeMore;
    data['linkUrl'] = this.linkUrl;
    data['mainTitle'] = this.mainTitle;
    data['sort'] = this.sort;
    data['subTitle'] = this.subTitle;
    return data;
  }
}
