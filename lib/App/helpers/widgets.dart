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
Widget noAccountUI(){
  return Padding(
    padding:  EdgeInsets.only(top:FontSize.size20),
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(text: noAccount),
          TextSpan(
            text: registerTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(text: ')'),
        ],
      ),
    ),
  );
}
// or border
Widget border(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: FontSize.size20, bottom: FontSize.size30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            height: FontSize.size1,
            color: grey2,
            width: MediaQuery.of(context).size.width * 0.4),
        Text(or),
        const Divider(
          height: 2.0,
          color: grey2,
        ),
        Container(
            height: FontSize.size1,
            color: grey2,
            width: MediaQuery.of(context).size.width * 0.4),
      ],
    ),
  );
}
