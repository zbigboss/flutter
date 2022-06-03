import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final List rightCategoryContentList;
  final String rightCategoryTitle;
  const CategoryListView({
    Key? key,
    required this.rightCategoryContentList,
    required this.rightCategoryTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 5),
            alignment: Alignment.bottomLeft,
            child: Text(
              rightCategoryTitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [_items(context)],
          ),
        ),
      ],
    );
  }

  _items(BuildContext context) {
    if (rightCategoryContentList == null) return null;
    List<Widget> items = [];
    for (var model in rightCategoryContentList) {
      items.add(_item(context, model));
    }
    return Container(
      child: Row(
        children: items,
      ),
    );
  }

  Widget _item(BuildContext context, Map<String, dynamic> model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            model['imgUrl'],
            width: 50.0,
            height: 50.0,
          ),
          Text(
            model['categoryName'],
            style: const TextStyle(fontSize: 12.0, color: Colors.black45),
          )
        ],
      ),
    );
  }
}
