import 'package:flutter/material.dart';
import 'package:cider/model/banner_model.dart';

class PictureGroup extends StatelessWidget {
  final List<BannerModel> pictureGroupList;
  const PictureGroup({Key? key, required this.pictureGroupList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Column(children: _columnC(context)), _right(context)],
    );
  }

  Widget _right(BuildContext contxt) {
    if (pictureGroupList.length == 3) {
      return Container(
          margin: const EdgeInsets.only(left: 10),
          height: pictureGroupList[2].height,
          width: pictureGroupList[2].width,
          child: Image.network(pictureGroupList[2].showUrl!));
    } else {
      return Container(
        margin: const EdgeInsets.only(left: 10),
        height: 100,
        width: 100,
        child: Text('xxx'),
      );
    }
  }

  _columnC(BuildContext context) {
    if (pictureGroupList == null) return [];
    List<Widget> items = [];
    for (var i = 0; i < pictureGroupList.length - 1; i++) {
      items.add(
        Container(
          height: pictureGroupList[i].height,
          width: pictureGroupList[i].width,
          margin: i == 0 ? const EdgeInsets.only(bottom: 10) : null,
          child: Image.network(pictureGroupList[i].showUrl!),
        ),
      );
    }
    return items;
  }
}
