import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/assets.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Profile extends StatefulWidget {
  Profile(this.fromMyProfile) : super();
  bool fromMyProfile;

  @override
  _ProfileState createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          profileImage(),
          profileName(),
          city(),
          buildButtons(),
          reward(),
        ],
      ),
    );
  }

  profileImage() {
    return Center(
      child: Padding(
        padding:  EdgeInsets.only(top:FontSize.size50),
        child: ClipOval(
          child: Image.network(
            'https://www.learningcontainer.com/wp-content/uploads/2020/08/Sample-Small-Image-PNG-file-Download.png',
            height: FontSize.size130,
            width: FontSize.size130,
          ),
        ),
      ),
    );
  }

  profileName() {
    return Padding(
      padding:EdgeInsets.only(top:FontSize.size20,
      bottom: FontSize.size14),
      child: Text(
        'PRAKASH',
        style: TextStyle(
            fontSize: FontSize.size35,
            fontStyle: FontStyle.normal,
            fontFamily: AppConfig.metropolis,
            color: black,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  city() {
    return Text(
      'NEWYORK,USA',
      style: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: AppConfig.metropolis,
          fontStyle: FontStyle.normal,
          fontSize: FontSize.size13,
          color: black),
    );
  }

  buildButtons() {
    return Padding(
      padding:  EdgeInsets.only(top:FontSize.size20,bottom:FontSize.size24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buttons(1),
          buttons(2),
        ],
      ),
    );
  }
  buttons(int i) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        width: FontSize.size150,
        height: FontSize.size50,
        decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.all(Radius.circular(FontSize.size6))),
        child: Center(
          child: Text(
           getButtonText(i,widget.fromMyProfile),
            style: TextStyle(
                color: white,
                decoration: TextDecoration.none,
                fontFamily: AppConfig.metropolis,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: FontSize.size14),
          ),
        ),
      ),
    );
  }

  String getButtonText(int i, bool fromMyProfile) {
    if(i==1){
      return fromMyProfile?edit:followText;
    }else{return setting;}
  }

  galleryView() {
  }

  reward() {
    return Row(
      children: [
        likeAndAwards(true),
        batchIcon(),
        likeAndAwards(false),
      ],
    );
  }

  likeAndAwards(bool forLike) {
    return Column(
      children: [
        Text(forLike?'1.1k':'4',style:AppConfig.mediumFontStyle,),
        Text(forLike?likes:awards,style:AppConfig.smallFontStyle,)
      ],
    );
  }

  batchIcon() {
    return Image.asset(medal);
  }
}
