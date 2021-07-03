import 'package:flutter/material.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFFef629f);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;

var gradientColor = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xeecda3),
      Color(0xef629f)
    ],
  ),
);
