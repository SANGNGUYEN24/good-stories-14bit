import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'walkthrough/main_walk.dart';
import 'walkthrough/data_walk.dart';


void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Walk_in(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Slide> slides = [];

  Function goToTab = () {};
  final Color color1 = HexColor("#EECDA3");
  final Color color2 = HexColor("#EF629F");

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Welcome",
        styleTitle: TextStyle(fontSize: 28, fontFamily: "Abel"),
        description: "Save the memories \nRetain the histories",
        styleDescription: TextStyle(fontSize: 20.0, fontFamily: "Abel"),
        pathImage: "Photo/a.png"
      )
    );
    slides.add(
        new Slide(
            title: "Slide1",
            description: "Bring memory",
            styleDescription: TextStyle(fontSize: 20.0, fontFamily: "Abel"),
            pathImage: "Photo/undraw_heartbroken_cble (1).png"
        )
    );
    slides.add(
        new Slide(
            title: "Slide1",
            description: "Bring memory",
            styleDescription: TextStyle(fontSize: 20.0, fontFamily: "Abel"),
            pathImage: "Photo/undraw_heartbroken_cble (1).png"
        )
    );
    slides.add(
        new Slide(
            title: "Slide1",
            description: "Bring memory",
            styleDescription: TextStyle(fontSize: 20.0, fontFamily: "Abel"),
            pathImage: "Photo/undraw_heartbroken_cble (1).png"
        )
    );
    slides.add(
        new Slide(
            title: "Slide1",
            description: "Bring memory",
            styleDescription: TextStyle(fontSize: 20.0, fontFamily: "Abel"),
            pathImage: "Photo/undraw_heartbroken_cble (1).png"
        )
    );
  }

  void onDonePress() {
    // Back to the first tab
    this.goToTab(0);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
    print(index);
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(CircleBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0x33ffcc5c)),
      overlayColor: MaterialStateProperty.all<Color>(Color(0x33ffcc5c)),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                    currentSlide.pathImage.toString(),
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  )),
              Container(
                child: Text(
                  currentSlide.title.toString(),
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description.toString(),
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  Widget renderNextBtn() {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      constraints: BoxConstraints.expand(width: 100, height: 100),
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color1, color2],
        ),
      ),
      child: Icon(
        Icons.navigate_next,
        color: Color(0xffffffff),
        size: 35.0,
      )
    );
    return Icon(
      Icons.navigate_next,
      color: Color(0xffffffff),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Container(
        padding: EdgeInsets.all(0),
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color1, color2],
          ),
        ),
        child: Icon(
          Icons.done,
          color: Color(0xffffffff),
          size: 35.0,
        )
    );
    return Icon(
      Icons.done,
      color: Color(0xffffffff),
    );
  }

  Widget renderSkipBtn() {
    return Container(

      child: Text(
        'Skip',
        style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Abel"),
      ),
    );
    return Icon(
      Icons.skip_next,
      color: Color(0xffffffff),
      size: 35.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: IntroSlider(
              slides: this.slides,

              // Skip button
              renderSkipBtn: this.renderSkipBtn(),
              // colorSkipBtn: Color(0x33ffcc5c),
              highlightColorSkipBtn: Color(0xffffcc5c),

              // Next button
              renderNextBtn: this.renderNextBtn(),


              // Done button
              renderDoneBtn: this.renderDoneBtn(),
              onDonePress: this.onDonePress,
              // colorDoneBtn: Color(0x33ffcc5c),
              highlightColorDoneBtn: Color(0xffffcc5c),

              // Dot indicator
              colorDot: Color(0xff9e9e9e),
              colorActiveDot: Color(0xffFFA8B0),
              sizeDot: 13.0,

              // Tabs
              listCustomTabs: this.renderListCustomTabs(),
              backgroundColorAllSlides: Colors.white,
              refFuncGoToTab: (refFunc) {
                this.goToTab = refFunc;
              },

              // Show or hide status bar
              //shouldHideStatusBar: true,

              // On tab change completed
              onTabChangeCompleted: this.onTabChangeCompleted,

            ),
          )
        ),
      ),
    );
  }
}

