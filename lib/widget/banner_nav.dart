import 'package:flutter/material.dart';
import 'package:cider/model/banner_model.dart';

class bannerNav extends StatelessWidget {
  final List<BannerModel> bannerList;
  const bannerNav({Key? key, required this.bannerList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return _item(context);
    return Image.network(
        "https://img.shopcider.com/hermes/posting/1647418986000-N8aMrN.jpg",
        height: 448.0,
        width: 335.0);
  }

  _item(
    BuildContext context,
  ) {
    if (bannerList.length == 1) {
      return Image.network(
          "https://img.shopcider.com/hermes/posting/1647418986000-N8aMrN.jpg");
    }
  }
}
