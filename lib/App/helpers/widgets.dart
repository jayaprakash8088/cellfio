import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/assets.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/view/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget copyRight(Color textColor, BuildContext context, FontWeight weight) {
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
Widget lightBGImage(BuildContext context) {
  return Stack(
    children: [
      Image.asset(
        splashBG,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white70,
      )
    ],
  );
}

Widget noAccountUI(BuildContext context) {
  return GestureDetector(
    onTap: () {
      dynamic route = MaterialPageRoute(builder: (context) => RegisterScreen());
      Navigator.push(context, route);
    },
    child: Padding(
      padding: EdgeInsets.only(top: FontSize.size20),
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
// name , profile img,date Ui

Widget profileNameDate(bool fromDiscover, bool isFollowing,BuildContext ctx) {
  return Row(
    children: [
      fromDiscover
          ? profileIcon(isFollowing,fromDiscover)
          : Padding(
              padding:
                  EdgeInsets.only(left: FontSize.size16, right: FontSize.size8),
              child: CircleAvatar(
                child: Image.asset(ellipse),
              ),
            ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pawel Czerwinski',
            style: TextStyle(
                color: white,
                fontFamily: AppConfig.metropolis,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: FontSize.size14,
                decoration: TextDecoration.none),
          ),
          Text(
            'Mar 22, 2020',
            style: TextStyle(
                color: grey,
                fontFamily: AppConfig.metropolis,
                fontSize: FontSize.size12,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
      fromDiscover&&isFollowing? Padding(
        padding:  EdgeInsets.only(right:FontSize.size10,
        left:MediaQuery.of(ctx).size.width*0.3),
        child: Text(followingMe,style: AppConfig.smallFontStyle,),
      ):Container()
    ],
  );
}

// profile icon
Widget profileIcon(bool isFollowing,bool fromDiscover) {
  return Padding(
    padding: EdgeInsets.only(right: FontSize.size10),
    child: SizedBox(
      height: FontSize.size45,
      child: Stack(
        children: [
          CircleAvatar(
            child: Image.asset(
              ellipse,
              height: FontSize.size40,
              width: FontSize.size40,
            ),
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    isFollowing ? following : follow,
                    height: 12.0,
                    width: 12.0,
                  )))
        ],
      ),
    ),
  );
}
