import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_stories/styles/constant.dart';

/// @author: sangnd
/// @date: 29/06/2021
/// This widget displays the detail of the story clicked from favorite page

class StoryFavorite extends StatefulWidget {
  const StoryFavorite({Key? key}) : super(key: key);

  @override
  _StoryFavoriteState createState() => _StoryFavoriteState();
}

class _StoryFavoriteState extends State<StoryFavorite> {
  /// SnackBar to show message to user
  void showSnackBarMessage(String mess) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.fixed,
      content: Row(
        children: [
          Icon(
            Icons.notification_important,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Text(mess)),
        ],
      ),
      backgroundColor: Colors.black.withOpacity(0.8),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// Build screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Color(orangeCustom),
        ),
        backgroundColor: Colors.white,

        /// This title display user's avatar and the date uploaded, user's name
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2019/11/18/00/38/dog-4633734__340.jpg',
                    )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  "11/10/2001",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                Text(
                  "Nguyen Quoc Viet",
                  style: TextStyle(color: Color(orangeCustom)),
                ),
              ],
            ),
          ],
        ),
      ),

      /**
         * Display all detail about stories
         */
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              border: Border.all(color: Color(orangeCustom)),
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(9),
                            topRight: Radius.circular(9)),
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2018/01/06/09/25/hijab-3064633__340.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),

                      /// Option button on top right of the image
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            //border: Border.all(color: Color(orangeCustom)),
                          ),
                          child: Icon(Icons.more_vert),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Heading of the story
                Text(
                  "Paragraphs & Topic Sentences",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "   A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points" +
                            "Paragraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
