/* 
  @author: Tri Pronton
  @date: 08/07/2021
  * This widget show a list of stories uploaded by user
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'components/body.dart';
import 'components/fancyFAB.dart';

class YourDairy extends StatefulWidget {
  @override
  _YourDairyState createState() => _YourDairyState();
}

class _YourDairyState extends State<YourDairy> {
  File avatar_image;
  Future getImageFromGallery() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      avatar_image = File(image.path);
    });
  }

  Future getImageFromCamera() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      avatar_image = File(image.path);
    });
  }

  // TODO: use this function below istead of the 2 getImageFromGallery() and getImageFromCamera() 
  Future SelectImageFromSouce(ImageSource source) async {
    final image = await ImagePicker().getImage(source: source);
    setState(() {
      avatar_image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // phan cua Sang da lam
        elevation: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("All"),
            Text("Favorite"),
            Text("Your Dairy"),
          ],
        ),
      ),
      body: Body(image: avatar_image),
      // floating point that contain 2 jobs: upload image by gallery and camera
      floatingActionButton: FancyFab(
        pressCamera: getImageFromCamera,
        pressGallery: getImageFromGallery,
      ),
    );
  }
}