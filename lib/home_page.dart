import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: 100,
                  floating: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Good Stories",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    background: Image.network(
                      "https://cdn.pixabay.com/photo/2021/01/27/07/19/baby-5953965__340.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                        unselectedLabelColor: Colors.black38,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xffeecda3), Color(0xffef629f)]
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Explore"),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Your diary"),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Favorite"),
                            ),
                          ),

                        ]),
                  ),
                  pinned: true,
                ),
              ];
            }, body: Container(),
          ),

        ),
      ),

    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
      return false;
  }

// @override
// bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {}
}
