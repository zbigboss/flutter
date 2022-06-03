import 'package:flutter/material.dart';
import 'package:cider/model/banner_model.dart';

class MultiColumn extends StatelessWidget {
  final List<BannerModel> multiColumnList;
  const MultiColumn({Key? key, required this.multiColumnList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _columnC(context),
    );
  }

  _columnC(BuildContext context) {
    if (multiColumnList == null) return [];
    List<Widget> items = [];
    for (var i = 0; i < multiColumnList.length; i++) {
      items.add(
        Container(
          height: multiColumnList[i].height,
          width: multiColumnList[i].width,
          margin: const EdgeInsets.all(5),
          child: Image.network(multiColumnList[i].showUrl!),
        ),
      );
    }
    return items;
  }
}
