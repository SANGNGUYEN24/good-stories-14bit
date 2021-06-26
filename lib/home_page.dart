import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_stories/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Flexible(
                            child: Container(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(color: Color(orangeCustom))
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Color(pinkCustom)),
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.black12
                                  ),
                                  hintText: "Search",
                                  prefixIcon: Icon(Icons.search, color: Color(orangeCustom),),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Tooltip(
                            message: 'Filter',
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.filter_alt, color: Color(orangeCustom),),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(
                                          color: Color(orangeCustom)
                                        )
                                  ))),
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Icon(Icons.movie),
              Icon(Icons.games),
            ]),
          )),
    );
  }
}
