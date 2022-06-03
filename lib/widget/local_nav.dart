import 'package:flutter/material.dart';
import 'package:cider/model/common_model.dart';

class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;
  const LocalNav({Key? key, required this.localNavList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal, children: [_items(context)]);
  }

  _items(BuildContext context) {
    if (localNavList == null) return null;
    List<Widget> items = [];
    localNavList.forEach((model) {
      items.add(_item(context, model));
    });
    return Container(
        child: Row(
      children: items,
    ));
  }

  Widget _item(BuildContext context, CommonModel model) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              model.showUrl!,
              width: model.width,
              height: model.height,
            ),
            Text(
              model.mainTitle!,
              style: TextStyle(fontSize: 12.0, color: Colors.black45),
            )
          ],
        ));
  }
}
