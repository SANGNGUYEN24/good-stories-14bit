import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:good_stories/pages/story_explore.dart';

import '../styles/constant.dart';

/// @author: sangnd
/// @date: 29/06/2021
///
/// This widget shows favorite stories of the user, when user click favorite symbol
/// that story will be added to favorite list

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  /// Check favorite status of the story
  bool favorite = false;

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
    print("This snackBar is called");
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// SnackBar with an action
  void showSnackBarMessageAction(String mess) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 4),
      behavior: SnackBarBehavior.floating,
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
      action: SnackBarAction(
        label: "OK",
        onPressed: () {
          favorite = false;
          showSnackBarMessage("Removed from favourite stories");
        },
      ),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// Build screen
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),

                /// Search bar for search story
                Flexible(
                  child: Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(orangeCustom))),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(pinkCustom)),
                        ),
                        hintStyle: TextStyle(color: Colors.black12),
                        hintText: "Search",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(orangeCustom),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                /// Filter button to filter stories based on emoji
                Tooltip(
                  message: 'Filter',
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.filter_alt,
                      color: Color(orangeCustom),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color(orangeCustom))))),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),

            /// StaggeredGridView to show all favorite stories of the user
            Flexible(
              child: StaggeredGridView.countBuilder(
                staggeredTileBuilder: (index) => index % 3 == 0
                    ? StaggeredTile.count(2, 2)
                    : StaggeredTile.count(1, 2),
                crossAxisCount: 3,
                itemCount: 50,
                itemBuilder: (context, index) {
                  return imageCard(index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  /// This widget display a story card (contains image, and the number of hearts)
  Widget imageCard(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (builder) {
          return StoryExplore();
        }));
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(fit: StackFit.expand, children: [
          /// Custom size of the image loaded from database
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://media.istockphoto.com/photos/trendy-girl-singing-favorite-song-out-loud-in-phone-as-mic-wearing-picture-id1256944025?b=1&k=6&m=1256944025&s=170667a&w=0&h=lpTa7G24o7BydWM8aInha2-r6sUCXWkh2DfzpyzaxR4=",
              fit: BoxFit.cover,
            ),
          ),

          /// Favorite button on each story
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
                    "241",
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
        ]),
      ),
    );
  }
}
