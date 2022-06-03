import 'package:cider/model/common_model.dart';
import 'package:cider/model/banner_model.dart';
import 'package:cider/model/new_in_model.dart';

class HomeModel {
  final List<CommonModel> localNavList;
  final List<BannerModel> bannerList;
  final List<BannerModel> pictureGroupList;
  final List<BannerModel> multiColumnList;
  final List<NewInModel> newInList;

  HomeModel({
    required this.localNavList,
    required this.bannerList,
    required this.pictureGroupList,
    required this.multiColumnList,
    required this.newInList,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    // 所有数据
    var jsonData = json['data']['itemList'];
    // navigateSlide
    var localNavListJson = [];
    // banner
    var bannerListJson = [];
    // picture-group
    var pictureGroupListJson = [];
    // multi-column
    var multiColumnListJson = [];
    //new-in sort-6
    var newInListJson = [];
    for (var i = 0; i < jsonData.length; i++) {
      if (jsonData[i]['sort'] == 0) {
        localNavListJson = jsonData[i]['collectionItems'] as List;
      }
      if (jsonData[i]['sort'] == 1) {
        bannerListJson = jsonData[i]['collectionItems'] as List;
      }
      if (jsonData[i]['sort'] == 3) {
        pictureGroupListJson = jsonData[i]['collectionItems'] as List;
      }
      if (jsonData[i]['sort'] == 5) {
        multiColumnListJson = jsonData[i]['collectionItems'] as List;
      }
      if (jsonData[i]['sort'] == 6) {
        newInListJson = jsonData[i]['collectionItems'] as List;
      }
    }
    List<CommonModel> localNavList =
        localNavListJson.map((i) => CommonModel.fromJson(i)).toList();
    List<BannerModel> bannerList =
        bannerListJson.map((i) => BannerModel.fromJson(i)).toList();
    List<BannerModel> pictureGroupList =
        pictureGroupListJson.map((i) => BannerModel.fromJson(i)).toList();
    List<BannerModel> multiColumnList =
        multiColumnListJson.map((i) => BannerModel.fromJson(i)).toList();
    List<NewInModel> newInList =
        newInListJson.map((i) => NewInModel.fromJson(i)).toList();
    return HomeModel(
      localNavList: localNavList,
      bannerList: bannerList,
      pictureGroupList: pictureGroupList,
      multiColumnList: multiColumnList,
      newInList: newInList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.localNavList != null) {
      data['localNavList'] = this.localNavList.map((v) => v.toJson()).toList();
    }
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }
    if (this.pictureGroupList != null) {
      data['pictureGroupList'] =
          this.pictureGroupList.map((v) => v.toJson()).toList();
    }
    if (this.multiColumnList != null) {
      data['multiColumnList'] =
          this.multiColumnList.map((v) => v.toJson()).toList();
    }
    if (this.newInList != null) {
      data['newInList'] = this.newInList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
