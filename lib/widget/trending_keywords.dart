import 'package:flutter/material.dart';

class TrendingKeywords extends StatelessWidget {
  final List<String> hotWordList;
  const TrendingKeywords({Key? key, required this.hotWordList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        child: Container(
          child: _RaiseButton(context),
        ),
      ),
    );
  }

  _RaiseButton(BuildContext contxt) {
    if (hotWordList == null) return [];
    List<Widget> button = [];
    Widget content;
    for (var i = 0; i < hotWordList.length; i++) {
      button.add(
        RaisedButton(
          child: Text(hotWordList[i]),
          color: Colors.deepOrange[50],
          textColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          onPressed: () {
            debugPrint(hotWordList[i]);
          },
        ),
      );
    }
    content = Container(
        margin: const EdgeInsets.only(right: 10.0, top: 10.0),
        child: Wrap(
          spacing: 5.0, // 主轴上子控件中间的间距
          children: button,
        ));
    return content;
  }
}
