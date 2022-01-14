import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/view/verification_screen.dart';
import 'package:flutter/material.dart';

class LoginNotifier with ChangeNotifier {
  // firstName text
  TextEditingController firstName = TextEditingController();

  //last name text
  TextEditingController lastName = TextEditingController();

  //email text
  TextEditingController email = TextEditingController();

  //password text
  TextEditingController password = TextEditingController();
  //login email
  TextEditingController loginMail=TextEditingController();
  //login password
  TextEditingController loginPassword=TextEditingController();
  // forgot email
  TextEditingController forgotMail=TextEditingController();
  // validateEmail
  bool validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  validate(BuildContext context) {
    if (checkFirstName()) {
      if (email.text.trim().isEmpty) {
        return AppConfig.raiseToast(enterEmail);
      } else {
        checkEmail(context);
      }
    } else {
      return AppConfig.raiseToast(enterFirstName);
    }
  }

  bool checkFirstName() {
    if (firstName.text.trim().isEmpty || lastName.text.trim().isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  dynamic checkEmail(BuildContext context) {
    if (validateEmail(email.text)) {
      checkPassword(context);
    } else {
      return AppConfig.raiseToast(checkMail);
    }
  }

  checkPassword(BuildContext context) {
    if (password.text.isEmpty || password.text.length <= 6) {
      return AppConfig.raiseToast(enterPassword);
    } else {
      proceedRegister(context);
    }
  }

// navigating to otp verification screen
  void proceedRegister(BuildContext context) {
    dynamic route =
        MaterialPageRoute(builder: (context) => VerificationScreen());
    Navigator.push(context, route);
  }

  //otp completion
  onCompleted(String pin) {}

//otp change
  onChanged(String pin) {}
}
