import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/helpers/app_bar.dart';
import 'package:cellfio/App/helpers/widgets.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/viewModel/login_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen() : super();

  @override
  _RegisterScreenState createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
    LoginNotifier loginNotifier =
        Provider.of<LoginNotifier>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginNotifier loginNotifier = Provider.of<LoginNotifier>(context);
    return Stack(
      children: [
        lightBGImage(context),
        Scaffold(
          backgroundColor: transparent,
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              child: registerUI(loginNotifier)),
        )
      ],
    );
  }

  Widget registerUI(LoginNotifier loginNotifier) {
    return Padding(
      padding: EdgeInsets.all(FontSize.size20),
      child: Column(
        children: [
          cellfioAppBar(registerTitle, context,true),
          alreadyHaveAccount(),
          registerButtons(1),
          SizedBox(
            height: FontSize.size8,
          ),
          registerButtons(2),
          border(),
          textFields(1, loginNotifier),
          textFields(2, loginNotifier),
          textFields(3, loginNotifier),
          textFields(4, loginNotifier),
          privacyPolicyUI(),
          registerButton(loginNotifier),
          copyRight(black, context, FontWeight.w500)
        ],
      ),
    );
  }

  alreadyHaveAccount() {
    return Padding(
      padding: EdgeInsets.only(top: FontSize.size15, bottom: FontSize.size22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            alreadyHaveAcc,
            style: TextStyle(
                color: black,
                fontWeight: FontWeight.w500,
                fontStyle: AppConfig.normal,
                fontSize: FontSize.size14,
                fontFamily: AppConfig.metropolis),
          ),
          Text(
            login1,
            style: TextStyle(
                color: black,
                fontWeight: FontWeight.w600,
                fontStyle: AppConfig.normal,
                fontSize: FontSize.size14,
                fontFamily: AppConfig.metropolis),
          )
        ],
      ),
    );
  }

  registerButtons(num i) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: FontSize.size50,
        decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.all(Radius.circular(FontSize.size6))),
        child: Center(
          child: Text(
            i == 1 ? registerWithFacebook : registerWithGoogle,
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

  void moveToNextScreen(num i) {
    // dynamic route=i==1?null:MaterialPageRoute(builder:(context)=>RegisterScreen());
    // Navigator.push(context, route);
  }

  Widget border() {
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

  Widget textFields(num i, LoginNotifier loginNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          i == 1
              ? firstName
              : i == 2
                  ? lastName
                  : i == 3
                      ? eMail
                      : password,
          style: TextStyle(
              color: black,
              decoration: TextDecoration.none,
              fontFamily: AppConfig.metropolis,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: FontSize.size14),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: FontSize.size6, bottom: FontSize.size20),
          child: TextFormField(
              obscureText: i == 4 ? true : false,
              controller: i == 1
                  ? loginNotifier.firstName
                  : i == 2
                      ? loginNotifier.lastName
                      : i == 3
                          ? loginNotifier.email
                          : loginNotifier.password,
              decoration: const InputDecoration(
                fillColor: white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.only(
                    top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
                // add padding to adjust text
                isDense: true,
              )),
        )
      ],
    );
  }

  privacyPolicyUI() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: FontSize.size5),
          child: Text(agree),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(terms,
                style: TextStyle(
                    color: black,
                    decoration: TextDecoration.underline,
                    fontFamily: AppConfig.metropolis,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: FontSize.size14)),
            Text(and),
            Text(privacyPolicy,
                style: TextStyle(
                    color: black,
                    decoration: TextDecoration.underline,
                    fontFamily: AppConfig.metropolis,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: FontSize.size14)),
          ],
        ),
      ],
    );
  }

  registerButton(LoginNotifier loginNotifier) {
    return GestureDetector(
      onTap: () {
        loginNotifier.proceedRegister(context);
      },
      child: Padding(
        padding: EdgeInsets.only(top: FontSize.size10, bottom: FontSize.size10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: FontSize.size50,
          decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.all(Radius.circular(FontSize.size6))),
          child: Center(
            child: Text(
              register,
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
      ),
    );
  }
}
