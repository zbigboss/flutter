import 'package:flutter/material.dart';
import 'package:cider/dao/search_dao.dart';
import 'package:cider/model/search/search_model.dart';
import 'package:cider/widget/trending_keywords.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  FocusNode focusNode = FocusNode();

  // 输入框内容
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  List<String> hotWordList = [];
  loadData() async {
    try {
      SearchModel model = await SearchDao.fetch();
      setState(() {
        hotWordList = model.hotWordList;
        print(hotWordList);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black54),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Search",
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black54),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.black54,
              ),
              onPressed: () {
                print('shopping_cart');
              })
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                flex: 9,
                child: Container(
                  height: 66.0,
                  child: TextField(
                    // autofocus: true,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Look for something?",
                      suffixIcon: _searchText.isEmpty
                          ? null
                          : InkWell(
                              onTap: () => _searchController.clear(),
                              child: const Icon(
                                Icons.clear,
                                color: Colors.black54,
                              ),
                            ),
                    ),
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                    ),
                    controller: _searchController,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 66.0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    onPressed: _searchKeyWords,
                  ),
                ),
              ),
            ]),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Trending',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: TrendingKeywords(hotWordList: hotWordList),
            ),
          ],
        ),
      ),
    );
  }

  // 搜索关键字
  _searchKeyWords() {
    print(_searchController.text);
  }
}
