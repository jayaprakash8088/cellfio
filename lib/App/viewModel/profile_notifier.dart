import 'package:flutter/cupertino.dart';

class ProfileNotifier with ChangeNotifier{
  bool isLiked=true;
  bool isFollowing=true;

  // click like
  Future likeClicked()async{
    isLiked=!isLiked;
    notifyListeners();
  }
}