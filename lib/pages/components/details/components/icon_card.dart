/* 
  @author: Tri Pronton
  @date: 08/07/2021
  * This widget is not used !
*/

import 'package:flutter/material.dart';
import 'package:demo_app/styles/constants.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    Key key, @required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 62,
      width: 62,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      // ding: EdgeInsets.all(kDefaultPadding/2),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: kPrimaryColor.withOpacity(0.23),
              blurRadius: 30,
              offset: Offset(0, 15)),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-15, -15),
            blurRadius: 20,
          )
        ],
      ),
      child: IconButton(
        iconSize: 62/1.3,
        color: kPrimaryColor.withOpacity(0.5),
        onPressed: () {}, icon: Icon(icon),
      ),
    );
  }
}
