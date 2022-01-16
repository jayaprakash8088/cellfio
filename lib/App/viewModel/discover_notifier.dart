import 'package:cellfio/App/utils/assets.dart';
import 'package:flutter/widgets.dart';

class DiscoverNotifier with ChangeNotifier{
 // discover page sample image
  List sampleImageList=[
    'images/img.png',
    'images/img1.png',
    'images/img2.png'];

  bool isLiked=true;
  bool isFollowing=true;

  // click like
 Future likeClicked()async{
   isLiked=!isLiked;
   notifyListeners();
 }
}