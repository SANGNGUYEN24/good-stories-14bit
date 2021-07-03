import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vscode_app/screens/constants.dart';

import 'components/body.dart';
import 'components/fancyFAB.dart';
// import 'components/expandable_FAB.dart';

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
  Future SelectImageFromSouce(ImageSource source) async{
    final image = await ImagePicker().getImage(source: source);

    setState(() {
    avatar_image = File(image.path);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 100,
          leading: IconButton(
            icon: const Icon(Icons.face),
            onPressed: () {},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("All"),
              Text("Favorite"),
              Text("Your Dairy"),
            ],
          )),
      body: Body(image: avatar_image),
      floatingActionButton: FancyFab(
        pressCamera: getImageFromCamera,
        pressGallery: getImageFromGallery,
      ),
      bottomNavigationBar: MyBottomNavi(),
    );
  }

}

class MyBottomNavi extends StatelessWidget {
  const MyBottomNavi({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: kDefaultPadding,
        bottom: kDefaultPadding,
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 20,
              color: kPrimaryColor.withOpacity(0.38))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.inbox_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.track_changes),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.backpack_outlined),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
