import 'package:flutter/cupertino.dart';

/// This file show all constant elements of the app

/// pink
const pinkCustom = 0xffef629f;
///orange
const orangeCustom = 0xffeecda3;

LinearGradient getGradient(/* To do may add theme */){
  return LinearGradient(
        colors: [Color(orangeCustom), Color(pinkCustom)]);
}
