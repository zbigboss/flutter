import 'package:flutter/material.dart';
import 'package:cider/model/new_in_model.dart';

class NewIn extends StatelessWidget {
  final List<NewInModel> newInList;
  const NewIn({Key? key, required this.newInList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            newInList.length == 1 ? newInList[0].mainTitle! : '',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            newInList.length == 1 ? newInList[0].subTitle! : '',
            style: const TextStyle(fontSize: 10.0, color: Colors.black87),
          ),
        ],
      ),
      Container(
        padding: const EdgeInsets.all(1),
        child: Row(
          children: const [Icon(Icons.remove_red_eye), Text('See All')],
        ),
      )
    ]);
  }
}
