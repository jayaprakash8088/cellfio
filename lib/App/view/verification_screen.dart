import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/helpers/app_bar.dart';
import 'package:cellfio/App/helpers/widgets.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/viewModel/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen() : super();

  @override
  _VerificationScreenState createState() {
    return _VerificationScreenState();
  }
}

class _VerificationScreenState extends State<VerificationScreen> {
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
            body: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  child: verificationUI(loginNotifier)),
            ),
          )
        ],
    );
  }

  verificationUI(LoginNotifier loginNotifier) {
    return Padding(
      padding:  EdgeInsets.all(FontSize.size15),
      child: Column(
        children: [
          cellfioAppBar(emailVerification, context,false),
          Padding(
            padding:  EdgeInsets.all(FontSize.size20),
            child: Text(enterPin,textAlign: TextAlign.center,style: TextStyle(
                fontStyle: AppConfig.normal,
                fontFamily: AppConfig.metropolis,
            fontSize: FontSize.size13,color: black,fontWeight: FontWeight.w400),),
          ),
          notReceivedPinUI(),
          pinCode(loginNotifier),
          validatePinUI(),
          copyRight(black, context, FontWeight.w500)
        ],
      ),
    );
  }

  notReceivedPinUI() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(notReceivedPin,style: TextStyle(
            fontStyle: AppConfig.normal,
            fontFamily: AppConfig.metropolis,
            fontSize: FontSize.size14,color: black,fontWeight: FontWeight.w500)),
        Text(resend,style: TextStyle(
            fontStyle: AppConfig.normal,
            fontFamily: AppConfig.metropolis,
            fontSize: FontSize.size14,color: black,fontWeight: FontWeight.w600),)
      ],
    );
  }

  pinCode(LoginNotifier loginNotifier) {
    return Padding(
      padding: EdgeInsets.only(top: FontSize.size60,
      left: FontSize.size30,right: FontSize.size30),
      child: PinCodeTextField(appContext: context, length: 4,
        onChanged:(pin)=>
        loginNotifier.onChanged(pin),
        obscureText: false,
        pinTheme: PinTheme(
          activeColor: black,
          activeFillColor:black,
          disabledColor: black,inactiveColor: black,
          inactiveFillColor: black,selectedColor: black
        ),
      keyboardType: TextInputType.number,
      blinkWhenObscuring: true,
        cursorColor: Colors.black,
      onCompleted:(pin)=> loginNotifier.onCompleted(pin),),
    );
  }
  validatePinUI(){
    return GestureDetector(
      onTap: () {
        // loginNotifier.proceedRegister(context);
      },
      child: Padding(
        padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.5, bottom: FontSize.size10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: FontSize.size50,
          decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.all(Radius.circular(FontSize.size6))),
          child: Center(
            child: Text(
              validatePin,
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