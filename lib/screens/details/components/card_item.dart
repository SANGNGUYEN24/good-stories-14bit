import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vscode_app/styles/constants.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:url_launcher/url_launcher.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    this.avatarImage,
    this.image,
    this.name,
    this.country,
    this.desc,
  });

  final ImageProvider<Object> avatarImage;
  final ImageProvider<Object> image;
  final String name;
  final String country; // recommend flag icon
  final String desc;
  @override
  _CardItem createState() => _CardItem(
        avatarImage: avatarImage,
        country: country,
        desc: desc,
        image: image,
        name: name,
      );
}

class _CardItem extends State<CardItem> {
  _CardItem({
    this.avatarImage,
    this.image,
    @required this.name,
    this.country,
    this.desc,
  });

  ImageProvider<Object> avatarImage;
  ImageProvider<Object> image;
  String name;
  String country; // recommend flag icon
  String desc;
  bool favorate = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          child: Container(
            height: size.width,
            child: Column(
              children: [
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
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.fill,
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
                SizedBox(
                  height: 14,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: favorate
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
                            Scaffold.of(context).showSnackBar(
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
                                duration: const Duration(milliseconds: 1500),
                                // width: 280.0, // Width of the SnackBar.
                                padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      8.0, // Inner padding for SnackBar content.
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            );
                          },
                          // color: Colors.grey,
                        ),
                        // SizedBox(
                        //   width: 8,
                        // ),
                        // Text(
                        //   "Like",
                        //   style: TextStyle(color: Colors.grey),
                        // ),
                      ],
                    ),
                    // SizedBox(
                    //   width: 14,
                    // ),
                    Row(
                      children: [
                        Icon(
                          Icons.comment_outlined,
                          // color: Colors.grey,
                        ),
                        // SizedBox(
                        //   width: 8,
                        // ),
                        // Text(
                        //   "Comment",
                        //   style: TextStyle(color: Colors.grey),
                        // ),
                      ],
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.share,
                          // color: Colors.grey,
                        ),
                        // SizedBox(
                        //   width: 8,
                        // ),
                        // Text(
                        //   "Share",
                        //   style: TextStyle(color: Colors.grey),
                        // ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
              ],
            ),
          ),
        ),
        Container(
          // Your description
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          // height: size.height / 5,
          width: size.width,
          // color: Colors.white,
          child: RichText(
            text: TextSpan(
              text: '199 likes',
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            // vertical: kDefaultPadding / 2,
          ),
          // height: size.height / 5,
          width: size.width,
          child: ExpandableText(
            desc,
            expandText: 'more',
            collapseText: 'less',
            maxLines: 2,
            linkColor: Colors.blue,
            animation: true,
            collapseOnTextTap: true,
            prefixText: name,
            onPrefixTap: () => {}, //showProfile(username),
            prefixStyle: TextStyle(fontWeight: FontWeight.bold),
            onHashtagTap: (name) => {}, //showHashtag(name),
            hashtagStyle: TextStyle(
              color: Color(0xFF30B6F9),
            ),
            onMentionTap: (username) => {}, // showProfile(username),
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

  void toggleFavorite() {
    if (favorate == true) {
      favorate = false;
    } else {
      favorate = true;
    }
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
