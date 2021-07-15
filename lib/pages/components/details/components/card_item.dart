/* 
  @author: Tri Pronton
  @date: 08/07/2021
  * This widget shows Diary's card which contains Diary information.
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:good_stories/styles/constant.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:url_launcher/url_launcher.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    required this.avatarImage,
    required this.image,
    required this.name,
    required this.country,
    required this.desc,
    required this.title,
    required this.numFavorite,
    required this.favorite,
  });

  final ImageProvider<Object> avatarImage;
  final ImageProvider<Object> image;
  final String name;
  final String country; // recommend flag icon
  final String desc;
  final String title;
  final int numFavorite;
  final bool favorite;
  @override
  _CardItem createState() => _CardItem(
      avatarImage: avatarImage,
      country: country,
      desc: desc,
      image: image,
      name: name,
      title: title,
      numFavorite: numFavorite,
      favorate: favorite);
}

class _CardItem extends State<CardItem> {
  _CardItem({
    this.avatarImage,
    required this.image,
    required this.name,
    required this.country,
    required this.desc,
    required this.title,
    required this.numFavorite,
    required this.favorate,
  });

  /*=========Diary Info =============*/
  ImageProvider<Object>? avatarImage;
  ImageProvider<Object> image;
  String name;
  String country; // recommend flag icon
  String desc;
  String title;
  int numFavorite;
  bool favorate;
  /*=================================*/

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
          child: Container(
            height: size.width,
            child: Column(
              children: [
                // Avatar and Diary's public date
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: avatarImage,
                    backgroundColor: kPrimaryColor,
                    radius: size.height * 0.8 * 0.03,
                    child: avatarImage == null
                        ? Text(
                            "Insert \nImage",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          )
                        : Container(
                            height: 0,
                            width: 0,
                          ),
                  ),
                  title: Text("Tri Huynh"),
                  subtitle: Text("1/1/2021"),
                  onTap: () {}, // access to profile
                ),
                // List of image in the Diary
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.contain,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.29),
                          offset: Offset(-10, 10),
                          blurRadius: 60,
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title of the Diary
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding / 4),
                      child: Text(
                        title == null ? 'Add Title Here' : title,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Favorite button
                    Row(
                      children: [
                        Text(
                          numFavorite.toString(),
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        IconButton(
                          padding: EdgeInsets.all(kDefaultPadding / 4),
                          icon: (favorate)
                              ? Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border),
                          onPressed: () {
                            setState(
                              () {
                                toggleFavorite();
                              },
                            );
                            // Snackbar shows noti when add/remove this Diary to Favorite list
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: favorate
                                    ? Text('Added to your favorite list')
                                    : Text('Removed from your favorite list'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    setState(() {
                                      toggleFavorite();
                                    });
                                  },
                                ),
                                duration: const Duration(
                                    milliseconds: kDurationSnackbar),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding,
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Expandable description with some interations
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          width: size.width,
          child: ExpandableText(
            desc,
            expandText: 'more',
            collapseText: 'less',
            maxLines: 3,
            linkColor: Colors.blue,
            animation: true,
            collapseOnTextTap: true,
            prefixText: name,
            onPrefixTap: () => {}, //TODO: showProfile(username),
            prefixStyle: TextStyle(fontWeight: FontWeight.bold),
            onHashtagTap: (name) => {}, //TODO: showHashtag(name),
            hashtagStyle: TextStyle(
              color: Color(0xFF30B6F9),
            ),
            onMentionTap: (username) => {}, //TODO: showProfile(username),
            mentionStyle: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            onUrlTap: _launchURL,
            urlStyle: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  // Toggle the status of Favorite button
  void toggleFavorite() {
    if (numFavorite == null) {
      numFavorite = 0;
    }
    if (favorate == null) {
      favorate = true;
      numFavorite++;
    } else if (favorate == true) {
      numFavorite = numFavorite == 0 ? 0 : numFavorite - 1;
      favorate = false;
    } else {
      favorate = true;
      numFavorite++;
    }
  }

  // Launch when click to url path
  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
