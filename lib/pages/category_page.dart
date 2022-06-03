import 'package:flutter/material.dart';
import 'package:cider/dao/category_dao.dart';
import 'package:cider/model/category/category_model.dart';
import 'package:cider/widget/category_list_view.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  // 右目录内容视图
  final List rightCategoryContentList = [];
  final String rightCategoryTitle = '';
  final bool selected = false;
  final double _ITEM_EXTENT = 120.0;

  // 右边listView滚动
  final ScrollController _scrollController = ScrollController();

  // ListView
  List categoryList = [];
  // String categoryList="";
  loadData() async {
    try {
      CategoryModel data = await CategoryDao.fetch();
      setState(() {
        categoryList = data.categoryList;
        print(categoryList.length);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Micas",
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
                Navigator.pushNamed(context, "shopping_bag");
              })
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 40.0,
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  onTap: (() => Navigator.pushNamed(context, "search_page")),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Search",
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    prefixIcon: const IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      onPressed: null,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey[200], //背景颜色，必须结合filled: true,才有效
                    filled: true,
                  ),
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 5),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 216, 204, 174)),
              child: const Text('Order over \$70 and get a free boho scarf'),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: LeftCategoryNav(
                        categoryList: categoryList,
                        rightCategoryTitle: rightCategoryTitle,
                        changeSelectedCallBack: (categoryList) {
                          setState(
                            () {
                              for (int i = 0; i < categoryList.length; i++) {
                                if (categoryList[i]['selected'] == true) {
                                  _scrollController.animateTo(i * _ITEM_EXTENT,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.ease);
                                  return;
                                }
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      controller: _scrollController,
                      itemExtent: _ITEM_EXTENT,
                      children: List.generate(
                        categoryList.length,
                        (i) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: CategoryListView(
                              rightCategoryContentList: categoryList[i]
                                  ['children'],
                              rightCategoryTitle: categoryList[i]
                                  ['categoryName'],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//左侧nav
class LeftCategoryNav extends StatefulWidget {
//  LeftCategoryNav({});
  final ValueChanged<dynamic> changeSelectedCallBack;

  List categoryList;
  String rightCategoryTitle;
  LeftCategoryNav(
      {Key? key,
      required this.categoryList,
      required this.rightCategoryTitle,
      required this.changeSelectedCallBack})
      : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  final actived = false;

  // 左侧类目导航下标
  int leftIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        right: BorderSide(width: 1.0, color: Colors.black12), //有边框
      )),
      child: ListView.builder(
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return _leftInkWell(index);
        },
      ),
    );
  }

  Widget _leftInkWell(int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                width: 5.0,
                color: leftIndex == index ? Colors.black : Colors.white),
          ),
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              // ignore: todo
              // TODO: 此处逻辑待优化,理论上应该在changeSelectedCallBack执行语句加入bool判断
              for (var item in widget.categoryList) {
                item['selected'] = false;
              }
              widget.categoryList[index]['selected'] = true;
              leftIndex = index;
            });
            widget.changeSelectedCallBack(widget.categoryList);
          },
          child: Text(
            widget.categoryList[index]['categoryName'],
            style: TextStyle(
                color: leftIndex == index ? Colors.black : Colors.grey,
                fontWeight:
                    leftIndex == index ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
