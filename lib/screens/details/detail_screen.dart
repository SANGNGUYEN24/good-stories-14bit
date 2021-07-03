import 'package:flutter/material.dart';
import 'package:vscode_app/screens/constants.dart';
import 'package:vscode_app/screens/details/components/body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({@required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(image: image), 
      appBar: AppBar(
        leading: IconButton(
          // color: kPrimaryColor,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Back"),
      ),
    );
  }
}
