import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:good_stories/pages/story_details.dart';

import '../styles/constant.dart';

/// @author: sangnd
/// @date: 29/06/2021
///
/// This widget shows stories of all users using app

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  // TODO set condition to avoid renderOverflow
  int favoriteNumber = 241;

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

                /// Search bar for searching stories
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

            /// Show list of the stories
            Flexible(
              child: StaggeredGridView.countBuilder(
                staggeredTileBuilder: (index) => index % 6 == 0
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

  /// TODO: add image card to 'constant.dart'
  /// Image card to show story

  Widget imageCard(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (builder) {
          return StoryDetails();
        }));
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(fit: StackFit.expand, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2018/03/31/06/31/dog-3277416__340.jpg",
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
        ]),
      ),
    );
  }
}
