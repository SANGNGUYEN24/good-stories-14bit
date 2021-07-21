
import 'package:flutter/material.dart';
import 'package:good_stories/pages/home_page.dart';
import 'package:good_stories/styles/constant.dart';

import 'pages/create_story.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  /// Test demo pull request
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Good Stories",
      theme: ThemeData(primaryColor: Color(pinkCustom)),
      home: HomePage(),
    );
  }
}
