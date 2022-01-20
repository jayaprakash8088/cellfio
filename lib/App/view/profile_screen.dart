import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/helpers/widgets.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/assets.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/viewModel/profile_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

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
    ProfileNotifier profileNotifier = Provider.of<ProfileNotifier>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            profileImage(),
            profileName(),
            city(),
            buildButtons(),
            reward(),
            postsFollows(),
            divider(),
            galleryView(profileNotifier)
          ],
        ),
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
        width: FontSize.size163,
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
// gallery view
  galleryView(ProfileNotifier profileNotifier) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,crossAxisSpacing: 4,
      itemCount: 14,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return tile(
           index,
           profileNotifier
        );
      },
    );
  }

  reward() {
    return Padding(
      padding:  EdgeInsets.only(left:FontSize.size20,right: FontSize.size10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          likeAndAwards(true),
          batchIcon(),
          likeAndAwards(false),
        ],
      ),
    );
  }

  likeAndAwards(bool forLike) {
    return Column(
      children: [
        Text(forLike?'1.1k':'4',style:AppConfig.mediumFontStyle,),
        SizedBox(height: FontSize.size20,),
        Text(forLike?likes:awards,style:AppConfig.lightGreyStyle,)
      ],
    );
  }

  batchIcon() {
    return Image.asset(medal,height: FontSize.size100,width: FontSize.size100,);
  }

  postsFollows() {
    return Padding(
      padding:  EdgeInsets.only(left:FontSize.size20,right: FontSize.size10,top: FontSize.size20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          post(1),
          Padding(padding: EdgeInsets.only(left:FontSize.size10),
          child:  post(2),),
          post(3),
        ],
      ),
    );
  }

  post(int i) {
    return Column(
      children: [
        Text('989',style: AppConfig.mediumFontStyle,),
        Text(i==1?posts:i==2?followers:followingText,style: AppConfig.lightGreyStyle,),
      ],
    );
  }
  tile(int index, ProfileNotifier profileNotifier) {
    return Stack(
      children: [
      Positioned.fill(child:   Image.asset('images/img1.png',
        height:index==0?200:300,fit: BoxFit.cover,)),
          Padding(padding: EdgeInsets.only(top:index==0?120:210),
          child: heartIcon(profileNotifier),)
      ],
    );
  }

  heartIcon(ProfileNotifier profileNotifier) {
    return Column(
      children: [
        Center(
          child: GestureDetector(
            onTap: (){
              profileNotifier.likeClicked();
            },
            child:profileNotifier.isLiked?
            Icon(Icons.favorite_border,color: blackBorder,size: FontSize.size24,):
            Icon(Icons.favorite,color: red,size: FontSize.size24,),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top:FontSize.size8,
              bottom: FontSize.size20),
          child: Text('71k',style: AppConfig.smallFontStyle,),
        ),
      ],
    );
  }
}
