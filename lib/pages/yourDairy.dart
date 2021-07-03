import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vscode_app/styles/constants.dart';
import 'package:vscode_app/screens/home/components/fancyFAB.dart';

import '../screens/home/components/body.dart';
// import 'components/expandable_FAB.dart';

class YourDairy extends StatefulWidget {
  @override
  _YourDairyState createState() => _YourDairyState();
}

class _YourDairyState extends State<YourDairy> {
  File _image;
  Future getImageFromGallery() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  Future getImageFromCamera() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image.path);
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
      // body: Center(child: _image == null ? Text("Image is not loaded"): Image.file(_image),),
      body: Body(
        image: _image,
      ),

      // floatingActionButton: ExpandableFab(
      //   distance: 112.0,
      //   children: [
      //     ActionButton(
      //       onPressed: () => _showAction(context, 0),
      //       icon: const Icon(Icons.post_add),
      //     ),
      //     ActionButton(
      //       onPressed: () => _showAction(context, 1),
      //       icon: const Icon(Icons.insert_photo),
      //     ),
      //     ActionButton(
      //       onPressed: () => _showAction(context, 2),
      //       icon: const Icon(Icons.camera),
      //     ),
      //   ]
      // ),
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
