/* 
  @author: Tri Pronton
  @date: 08/07/2021
  * This widget is body of Your Diary Screen
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:good_stories/styles/constant.dart';

import 'details/detail_screen.dart';

class Body extends StatefulWidget {
  Body({required this.image});
  File image;
  @override
  _BodyState createState() => _BodyState(avatar_image: image);
}

class _BodyState extends State<Body> {
  _BodyState({this.avatar_image});
  File? avatar_image;
  // List of images' paths
  List<String> images = [
    'corgi_lego.jpg',
    'sheep_lego.jpg',
    'dog_lego.jpg',
    'cat_lego.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchBox(),
          TitleWithAvatar(avatar_image: avatar_image),
          // trick to show dynamic List: use map
          ...images.map((e) {
            return ImageCard(
              image: e,
              favoriteNumber: 0,
            );
          })
        ],
      ),
    );
  }
}

// widget shows search box
class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 50,
            color: kPrimaryColor.withOpacity(0.23),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: kPrimaryColor.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

// widget shows Title (Your Album) on the left side and Avatar on the right side
class TitleWithAvatar extends StatelessWidget {
  const TitleWithAvatar({
    Key? key,
    this.avatar_image,
  }) : super(key: key);

  final File? avatar_image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Row(
        children: [
          TitleWithCustomUnderline(text: 'Your Albums'),
          Spacer(),
          CircleAvatar(
            backgroundColor: kPrimaryColor,
            // ignore: unnecessary_null_comparison
            backgroundImage: avatar_image == null
                ? NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/000/420/940/original/avatar-icon-vector-illustration.jpg")
                : FileImage(avatar_image!) as ImageProvider,
            radius: 20,
          )
        ],
      ),
    );
  }
}

// widget shows color-underline of Title
class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}

// widget shows image's view
class ImageCard extends StatelessWidget {
  const ImageCard({
    required this.image,
    required this.favoriteNumber,
  }) ;

  final String image;
  final int favoriteNumber;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(kDefaultPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(
                          image: image,
                        )),
              );
            },
            child: Stack(
              fit: StackFit.loose,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(
                      'assets/images/$image',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 4,
                  left: 4,
                  height: 20,
                  width: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      border: Border.all(color: Color(orangeCustom)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$favoriteNumber",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
