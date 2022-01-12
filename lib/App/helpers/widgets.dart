import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/assets.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget copyRight(Color textColor, BuildContext context,FontWeight weight) {
  return Text(
    copyright,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: textColor,
      fontSize: FontSize.size12,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: weight,
    ),
  );
}
/// light bg image
Widget lightBGImage(BuildContext context){
  return Stack(
    children: [
      Image.asset(splashBG,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,),
      Container(height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white70,)
    ],
  );
}
