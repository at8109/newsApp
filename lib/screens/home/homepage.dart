import 'package:flutter/material.dart';
import 'package:ten_news/model/categories_model.dart';
import 'package:ten_news/reusable/custom_cards.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  TabController _tabController;
  int currentIndex = 0;

  _smoothScrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(microseconds: 300), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(_smoothScrollToTop());
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top News Updates",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: EdgeInsets.only(right: 15),
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(),
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelColor: Colors.black45,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  tabs: List.generate(categories.length,
                      (index) => Text(categories[index].name)),
                ),
              ),
            ),
          ];
        },
        body: Container(
          child: TabBarView(
              controller: _tabController,
              children: List.generate(categories.length, (index) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return HomePageCard();
                  },
                  padding: EdgeInsets.symmetric(horizontal: 25),
                );
              })),
        ));
  }
}
