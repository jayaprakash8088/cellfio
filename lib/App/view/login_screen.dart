import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/helpers/app_bar.dart';
import 'package:cellfio/App/helpers/widgets.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/view/forgot_password.dart';
import 'package:cellfio/App/viewModel/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen() : super();

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
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
    LoginNotifier loginNotifier = Provider.of<LoginNotifier>(context);
    return Stack(
      children: [
        lightBGImage(context),
        Scaffold(
          backgroundColor: transparent,
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              child: loginUI(loginNotifier)),
        )
      ],
    );
  }

  loginUI(LoginNotifier loginNotifier) {
    return Padding(
      padding: EdgeInsets.all(FontSize.size15),
      child: Column(
        children: [
          cellfioAppBar(login1, context, true),
          noAccountUI(context),
          Padding(
            padding: EdgeInsets.only(top: FontSize.size20),
            child: buttons(loginNotifier),
          ),
          loginBtn(loginNotifier),
          copyRight(black, context, FontWeight.w500)
        ],
      ),
    );
  }

  buttons(LoginNotifier loginNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loginButtons(1),
        SizedBox(
          height: FontSize.size8,
        ),
        loginButtons(2),
        border(context),
        textFields(1, loginNotifier),
        textFields(2, loginNotifier),
        GestureDetector(
          onTap: () {
            dynamic route =
                MaterialPageRoute(builder: (context) => ForgotPassword());
            Navigator.push(context, route);
          },
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: forgotPassword),
                TextSpan(
                  text: passClick,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  loginButtons(num i) {
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
            i == 1 ? loginWithFB : loginWithGoogle,
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

  // email and password
  Widget textFields(num i, LoginNotifier loginNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          i == 1 ? mail : pass,
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
              EdgeInsets.only(top: FontSize.size10, bottom: FontSize.size20),
          child: TextFormField(
              controller: i == 1
                  ? loginNotifier.loginMail
                  : loginNotifier.loginPassword,
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

  loginBtn(LoginNotifier loginNotifier) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding:
            EdgeInsets.only(top: FontSize.size100, bottom: FontSize.size10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: FontSize.size50,
          decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.all(Radius.circular(FontSize.size6))),
          child: Center(
            child: Text(
              login,
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
