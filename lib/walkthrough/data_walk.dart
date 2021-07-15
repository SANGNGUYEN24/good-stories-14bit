import 'package:flutter/material.dart';

class Intro_Slider {
  // Variable
  String? imageAssetPath;
  String? desc;

  // Constructor for class
  Intro_Slider({this.imageAssetPath, this.desc});

  // Set method
  void setImageAssetPath(String imageAssetPath) {
    this.imageAssetPath = imageAssetPath;
  }
  void setDesc(String desc) {
    this.desc = desc;
  }

  // Get method
  String getImageAssetPath() {
    return this.imageAssetPath.toString();
  }
  String getDesc() {
    return this.desc.toString();
  }
}

// List of walkthrough slide
List<Intro_Slider> getSlides() {
  // Define the slides to return
  List<Intro_Slider> slides = [];
  Intro_Slider slider = new Intro_Slider();

  // Add slide 1
  slider.setDesc("desc");
  slider.setImageAssetPath("Photo/undraw_heartbroken_cble (1).png");
  slides.add(slider);
  slider = new Intro_Slider();

  // Add slide 2
  slider.setDesc("desc2");
  slider.setImageAssetPath("Photo/undraw_Live_photo_re_4khn.png");
  slides.add(slider);
  slider = new Intro_Slider();

  // Add slide 3
  slider.setDesc("desc2");
  slider.setImageAssetPath("Photo/undraw_Photo_sharing_re_jip7.png");
  slides.add(slider);
  slider = new Intro_Slider();

  // Add slide 4
  slider.setDesc("desc2");
  slider.setImageAssetPath("Photo/undraw_Private_data_re_4eab.png");
  slides.add(slider);
  slider = new Intro_Slider();
  return slides;
}