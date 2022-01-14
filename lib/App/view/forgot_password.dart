import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/helpers/app_bar.dart';
import 'package:cellfio/App/helpers/widgets.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/view/verification_screen.dart';
import 'package:cellfio/App/viewModel/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword() : super();

  @override
  _ForgotPasswordState createState() {
    return _ForgotPasswordState();
  }
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
              child: forgotPasswordUI(loginNotifier)),
        )
      ],
    );
  }

  forgotPasswordUI(LoginNotifier loginNotifier) {
    return Padding(
      padding: EdgeInsets.all(FontSize.size15),
      child: Column(
        children: [
          cellfioAppBar(forgotPwd, context, true),
          noAccountUI(context),
          Padding(
            padding:
            EdgeInsets.only(top: FontSize.size20),
            child: buttons(loginNotifier),
          ),
          Text(pinSent, style: TextStyle(
              color: black,
              decoration: TextDecoration.none,
              fontFamily: AppConfig.metropolis,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: FontSize.size14),),
          Text('us**ar@g**l.c*m', style: TextStyle(
              color: black,
              decoration: TextDecoration.none,
              fontFamily: AppConfig.metropolis,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: FontSize.size14),),
          SizedBox(height: FontSize.size50,),
          resetBtn(loginNotifier),
          Padding(
            padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.5),
            child: copyRight(black, context, FontWeight.w500),
          )
        ],
      ),
    );
  }

  resetBtn(LoginNotifier loginNotifier) {
    return GestureDetector(
      onTap: () {
        dynamic route=MaterialPageRoute(builder: (context)=>VerificationScreen(true));
        Navigator.push(context, route);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: FontSize.size50,
        decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.all(Radius.circular(FontSize.size6))),
        child: Center(
          child: Text(
            resetPassword,
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

  buttons(LoginNotifier loginNotifier) {
    return Padding(
      padding:  EdgeInsets.only(right:FontSize.size20,left: FontSize.size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           mail,
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
                controller:loginNotifier.forgotMail,
                decoration: const InputDecoration(
                  fillColor: white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color:grey),
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
      ),
    );
  }
}