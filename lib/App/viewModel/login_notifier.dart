import 'package:cellfio/App/utils/app_config.dart';
import 'package:flutter/material.dart';

class LoginNotifier with ChangeNotifier{
  // firstName text
  TextEditingController firstName=TextEditingController();
  //last name text
  TextEditingController lastName=TextEditingController();
  //email text
  TextEditingController email=TextEditingController();
  //password text
  TextEditingController password=TextEditingController();
  // validateEmail
  String validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return '';
    }
  }
  validate(BuildContext context){
    if(firstName.text.trim().isEmpty){
      return AppConfig.raiseToast('Enter FirstName');
    }
  }
}