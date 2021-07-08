import 'package:flutter/material.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFFef629f);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;

const kDurationSnackbar = 1500;

/// This file show all constant elements of the app
/// pink
const pinkCustom = Color(0xffef629f);
///orange
const orangeCustom = Color(0xffeecda3);

var gradientColor = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      pinkCustom,
      orangeCustom
    ],
  ),
);