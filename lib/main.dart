import 'package:flutter/material.dart';
import 'package:good_stories/constant.dart';
import 'package:good_stories/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Good Stories",
      theme: ThemeData(
        primaryColor: Color(pinkCustom)
      ),
      home: HomePage(),
    );
  }
}

