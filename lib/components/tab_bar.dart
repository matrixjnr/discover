import 'package:flutter/material.dart';
import 'package:discover_kenya/tools/tab.dart';
import 'package:discover_kenya/components/home_grid.dart';
import 'package:discover_kenya/categories_pics.dart' as cat_pics;

class CategoriesTabBar extends StatefulWidget {
  const CategoriesTabBar({Key key}) : super(key: key);

  @override
  CategoriesTabBarState createState() => CategoriesTabBarState();
}

class CategoriesTabBarState extends State<CategoriesTabBar>
    with TickerProviderStateMixin {
  var categoriesList = [
    "Wildlife",
    "Architecture",
    "Landscape",
    "Beach",
    "Creative",
    "Fashion",
    "Food",
    "Culture",
    "Night"
  ];

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: categoriesList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 25.0,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(left: 28.0),
        child: new TabBar(
            controller: _controller,
            labelPadding: EdgeInsets.all(0),
            indicatorPadding: EdgeInsets.all(0),
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicator: RoundedRectangleTabIndicator(
              width: 28,
              weight: 2,
              color: Colors.red,
            ),
            tabs: categoriesList
                .map((category) => Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0),
                        child: Text(category),
                      ),
                    ))
                .toList()),
      ),
      Container(
        height: 500,
        child: new TabBarView(
          controller: _controller,
          // children: categoriesList
          //     .map((category) => HomeGrid(pics: cat_pics.beach))
          //     .toList(),
          children: [
            HomeGrid(pics: cat_pics.wildlife),
            HomeGrid(pics: cat_pics.architecture),
            HomeGrid(pics: cat_pics.landscape),
            HomeGrid(pics: cat_pics.beach),
            HomeGrid(pics: cat_pics.creative),
            HomeGrid(pics: cat_pics.fashion),
            HomeGrid(pics: cat_pics.food),
            HomeGrid(pics: cat_pics.culture),
            HomeGrid(pics: cat_pics.night),
          ],
        ),
      ),
    ]);
  }
}
