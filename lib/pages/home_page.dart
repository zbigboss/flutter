import 'package:flutter/material.dart';
import 'package:cider/model/home_model.dart';
import 'package:cider/model/common_model.dart';
import 'package:cider/dao/home_dao.dart';
import 'package:cider/widget/local_nav.dart';
import 'package:cider/widget/banner_nav.dart';
import 'package:cider/widget/picture_group.dart';
import 'package:cider/widget/multi_column.dart';
import 'package:cider/model/banner_model.dart';
import 'package:cider/model/new_in_model.dart';
import 'package:cider/widget/new_in.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<CommonModel> localNavList = [];
  List<BannerModel> bannerList = [];
  List<BannerModel> pictureGroupList = [];
  List<BannerModel> multiColumnList = [];
  List<NewInModel> newInList = [];
  String resultString = '';
  List _imageUrls = [
    "https://img1.shopcider.com/product/1648551737000-ZDMHB3.png",
    "https://img1.shopcider.com/product/1641887923000-rJadbE.jpg",
    "https://img1.shopcider.com/product/1648447854000-RdjZAJ.jpg",
  ];
  String cartCount = '1';
  loadData() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
        bannerList = model.bannerList;
        pictureGroupList = model.pictureGroupList;
        multiColumnList = model.multiColumnList;
        newInList = model.newInList;
        // resultString = json.encode(model.pictureGroupList);
      });
    } catch (e) {
      print(e.toString());
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
        // backgroundColor: Colors.red,
        // ignore: unnecessary_new
        appBar: new AppBar(
          leading: Container(
            child: const Text(
              'Micas',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(5, 25, 0, 0),
            width: 100,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "search_page");
              },
            ),
            Stack(
              children: [
                Container(
                  // color: Colors.red,
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "shopping_bag");
                    },
                  ),
                ),
                Positioned(
                    right: 7,
                    top: 3,
                    child: Container(
                      width: 15,
                      height: 15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        cartCount,
                        style: TextStyle(color: Colors.white, fontSize: 8.0),
                      ),
                    )),
              ],
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                  height: 80,
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10),
                  child: LocalNav(localNavList: localNavList)),
              Container(
                  height: 448.0,
                  width: 335.0,
                  color: Colors.black12,
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: bannerNav(bannerList: bannerList)),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                alignment: Alignment.bottomLeft,
                child: const Text('Shop by Category',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: PictureGroup(pictureGroupList: pictureGroupList)),
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: MultiColumn(multiColumnList: multiColumnList)),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: NewIn(newInList: newInList)),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  height: 160,
                  padding: EdgeInsets.all(10.0),
                  child: Swiper(
                    itemCount: 3,
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(_imageUrls[index],
                          fit: BoxFit.contain //BoxFit.fill,
                          );
                    },
                    pagination: SwiperPagination(),
                  ),
                ),
              ),
            ])
          ],
        ));
  }
}
