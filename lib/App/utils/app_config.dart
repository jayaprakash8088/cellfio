import 'package:cellfio/App/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConfig{
  // font family
  static String metropolis = 'Metropolis';

  //font style
  static FontStyle normal = FontStyle.normal;
  static FontStyle italic = FontStyle.italic;
  // show Toast
 static Future raiseToast(String text) async {
   return Fluttertoast.showToast(msg:text,
   textColor: black,backgroundColor: grey);
 }
}