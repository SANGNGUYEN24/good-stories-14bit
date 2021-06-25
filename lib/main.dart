import 'package:flutter/material.dart';
import 'package:good_stories/home_page.dart';

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
        primaryColor: Color(0xffef629f)
      ),
      home: HomePage(),
    );
  }
}

