/*
  @author: Tri Pronton
  @date: 3/7/2021
 */
import 'package:flutter/material.dart';
import 'screens/constants.dart';
import 'pages/yourDairy.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upload Image',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply( bodyColor: kTextColor,),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: YourDairy(),
    );
  }
}
//folowings
// cach hinh 
// description

// 1. khong nen la mau do
// 2. limit max

// hoir sang 
// ->cach bo tri anh
// Cliprrect,
// gradient color