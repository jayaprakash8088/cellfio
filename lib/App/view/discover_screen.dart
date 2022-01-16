import 'package:cellfio/App/helpers/widgets.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/assets.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/viewModel/discover_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen() : super();

  @override
  _DiscoverScreenState createState() {
    return _DiscoverScreenState();
  }
}

class _DiscoverScreenState extends State<DiscoverScreen> {
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
    DiscoverNotifier discoverNotifier = Provider.of<DiscoverNotifier>(context);
    return Scaffold(
      body:PageView.builder(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: discoverNotifier.sampleImageList.length,
          itemBuilder: (
          BuildContext context,int index){
        return  Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image:AssetImage(discoverNotifier.sampleImageList[index]),
              fit: BoxFit.cover,
            ),
          ),
          child: discoverUI(discoverNotifier),
        );
      }),
    );
  }

  discoverUI(DiscoverNotifier discoverNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        optionsUI(discoverNotifier),
        Padding(
          padding:  EdgeInsets.only(left: FontSize.size15),
          child: profileNameDate(true,discoverNotifier.isFollowing),
        ),
        Padding(
          padding:  EdgeInsets.only(left: FontSize.size15,
          top: FontSize.size10,
          bottom: FontSize.size20),
          child: Text('data has  fkjkntwjnwj  lwrntkw n j w e nrj wnkwjn wkltnw',
          textAlign: TextAlign.center,
          style: AppConfig.smallFontStyle,),
        )
      ],
    );
  }

  optionsUI(DiscoverNotifier discoverNotifier) {
    return Padding(
      padding:  EdgeInsets.all(FontSize.size20),
      child: Column(
        children: [
          heartIcon(discoverNotifier),
          Padding(
            padding:  EdgeInsets.only(top:FontSize.size8,
            bottom: FontSize.size20),
            child: Text('71',style: AppConfig.smallFontStyle,),
          ),
          GestureDetector(onTap: (){},
          child: Image.asset(comment,height: FontSize.size24,
          width: FontSize.size24,),),
          Padding(
            padding:  EdgeInsets.only(top:FontSize.size8,
                bottom: FontSize.size20),
            child: Text('2',style: AppConfig.smallFontStyle,),
          ),
          GestureDetector(onTap: (){},
            child: Image.asset(share,height: FontSize.size24,
              width: FontSize.size24,),),
          Padding(
            padding:  EdgeInsets.only(top:FontSize.size8,
                bottom: FontSize.size20),
            child: Text('3',style: AppConfig.smallFontStyle,),
          ),
          GestureDetector(onTap: (){},
            child: Image.asset(info,height: FontSize.size24,
              width: FontSize.size24,),),
        ],
      ),
    );
  }

  heartIcon(DiscoverNotifier discoverNotifier) {
   return GestureDetector(
      onTap: (){
        discoverNotifier.likeClicked();
      },
      child:discoverNotifier.isLiked?
      Icon(Icons.favorite_border,color: blackBorder,size: FontSize.size24,):
      Icon(Icons.favorite,color: red,size: FontSize.size24,),
    );
  }
}