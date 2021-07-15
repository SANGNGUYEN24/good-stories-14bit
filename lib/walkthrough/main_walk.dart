import 'package:flutter/material.dart';
import 'data_walk.dart';

class Walk_in extends StatefulWidget {
  const Walk_in({Key? key}) : super(key: key);

  @override
  _Walk_inState createState() => _Walk_inState();
}

class _Walk_inState extends State<Walk_in> {
  @override
  List<Intro_Slider> changeSlides = getSlides();
  int slideIdx = 0;
  PageController controller = new PageController();

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.pinkAccent : Colors.blueGrey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height - 60,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIdx = index;
              });
            },
            children: <Widget>[
              SlideTile(
                imagePath: changeSlides[0].getImageAssetPath(),
                desc: changeSlides[0].getDesc(),
              ),
              SlideTile(
                imagePath: changeSlides[1].getImageAssetPath(),
                desc: changeSlides[1].getDesc(),
              ),
              SlideTile(
                imagePath: changeSlides[2].getImageAssetPath(),
                desc: changeSlides[2].getDesc(),
              ),
              SlideTile(
                imagePath: changeSlides[3].getImageAssetPath(),
                desc: changeSlides[3].getDesc(),
              ),
            ],
          ),
        ),
        bottomSheet: slideIdx != 3 ? Container(
          // color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                // color: Colors.white,
                child: FlatButton(
                    onPressed: () {
                      controller.animateToPage(
                          3,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear
                      );
                      print("Skip the slide");
                    },
                    splashColor: Colors.blue,
                    // child: Icon(MdiIcons.spa),
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                          color: Color(0xFF0074E4),
                          fontWeight: FontWeight.w600
                      ),
                    )

                ),
              ),
              Container(
                // color: Colors.white,
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++) i == slideIdx ? _buildPageIndicator(true): _buildPageIndicator(false),
                  ],
                ),
              ),
              Container(
                // color: Colors.white,
                child: FlatButton(
                    onPressed: () {
                      print("This is slide index: $slideIdx");
                      controller.animateToPage(
                          slideIdx + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                      );
                    },
                    splashColor: Colors.blue,
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                          color: Color(0xFF0074E4),
                          fontWeight: FontWeight.w600
                      ),
                    )
                ),
              ),
            ],
          ),
        ) : InkWell(
          onTap: () {
            print("Get started now");
          },
          child: Container(
            height: 60,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "GET STARTED NOW",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String? imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 60),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath.toString()),
          SizedBox(height: 20),
          Text(
            desc.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              fontFamily: 'Abel',
            ),
          )
        ],
      ),
    );
  }
}
