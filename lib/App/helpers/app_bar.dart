import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:flutter/material.dart';


Widget cellfioAppBar(String title,BuildContext context,bool backPress){
  return Row(
    children: [
    Visibility(
      visible: backPress,
      child: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.keyboard_backspace, color: black, size: FontSize.size24,)),
    ),
      Expanded(
        child: Center(
          child: Text(title,
            style: TextStyle(color: black,
                fontFamily: AppConfig.metropolis,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: FontSize.size24),
          ),
        ),
      ),
    ],
  );
}
