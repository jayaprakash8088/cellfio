import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConfig {
  // font family
  static String metropolis = 'Metropolis';

  //font style
  static FontStyle normal = FontStyle.normal;
  static FontStyle italic = FontStyle.italic;

  // show Toast
  static Future raiseToast(String text) async {
    return Fluttertoast.showToast(
        msg: text, textColor: black, backgroundColor: grey);
  }

  // text style
  static TextStyle smallFontStyle = TextStyle(
      fontWeight: FontWeight.w400,
      color: smallText,
      fontSize: FontSize.size12,
      fontFamily: AppConfig.metropolis,
      fontStyle: FontStyle.normal);
  //medium style text
  static TextStyle mediumFontStyle=TextStyle(
    fontWeight: FontWeight.w500,color: black,
    fontStyle: FontStyle.normal,fontFamily: metropolis,
     fontSize: FontSize.size18
  );
}
