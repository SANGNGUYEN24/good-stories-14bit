import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_stories/styles/constant.dart';
import 'package:good_stories/pages/your_diary.dart';

import 'explore.dart';
import 'favorite.dart';

/// @author: sangnd
/// @date: 29/06/2021
/// This widget shows home screen of the app

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

/// Build screen

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Custom TabBar with 3 elements: Explore, Your diary, Favorite
      body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 80, top: 0),
                child: AppBar(
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  bottom: TabBar(
                      unselectedLabelColor: Color(pinkCustom),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(orangeCustom), Color(pinkCustom)]),
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xffeecda3)),
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
              ),
            ),
            body: TabBarView(children: [
              /// Explore page
              Explore(),
              /// Your diary page
              YourDiary(),
              /// Favorite page
              Favorite(),
            ]),
          )),
    );
  }
}
