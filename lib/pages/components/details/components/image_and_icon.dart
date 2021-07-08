/* 
  @author: Tri Pronton
  @date: 08/07/2021
  * This widget is not used ! 
*/

import 'package:flutter/material.dart';
import 'package:demo_app/styles/constants.dart';

import 'icon_card.dart';

class ImageAndIcon extends StatelessWidget {
  const ImageAndIcon({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3), // ?
      // padding: EdgeInsets.all(kDefaultPadding),
      child: SizedBox(
        // In somecase, SizedBox is more efficient than Container
        height: size.height * 0.8,
        child: Row(
          children: [
            Expanded( // Icons
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    IconCard(icon: Icons.sentiment_very_satisfied_outlined),
                    IconCard(icon: Icons.emoji_emotions_outlined),
                    IconCard(icon: Icons.sentiment_dissatisfied),
                    IconCard(icon: Icons.mood_bad_outlined),
                  ],
                ),
              ),
            ),
            Container( // Images
              padding: EdgeInsets.only(
                top: kDefaultPadding,
                right: kDefaultPadding / 2,
              ),
              width: size.width * 0.75,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/image1.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
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
          ],
        ),
      ),
    );
  }
}
