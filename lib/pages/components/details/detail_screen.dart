/* 
  @author: Tri Pronton
  @date: 08/07/2021
  * This widget shows the detail of a diary/story that contains scripts and images
*/

import 'package:flutter/material.dart';
import 'package:demo_app/pages/components/details/components/body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({@required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Back"),
      ),
      body: Body(image: image),
    );
  }
}
