import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/helpers/app_bar.dart';
import 'package:cellfio/App/helpers/widgets.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/viewModel/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetPassword extends StatefulWidget {
  SetPassword() : super();

  @override
  _SetPasswordState createState() {
    return _SetPasswordState();
  }
}

class _SetPasswordState extends State<SetPassword> {
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
              child: setPasswordUI(loginNotifier)),
        )
      ],
    );
  }

  setPasswordUI(LoginNotifier loginNotifier) {
   return Padding(
     padding:  EdgeInsets.all(FontSize.size15),
     child: Column(
       children: [
         cellfioAppBar(setPassword, context, false),
         SizedBox(height: FontSize.size20,),
         textFields(1, loginNotifier),
         textFields(2, loginNotifier),
         resetBtn(loginNotifier),
         Padding(
           padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.5),
           child: copyRight(black, context, FontWeight.w500),
         )
       ],
     ),
   );
  }
  Widget textFields(num i, LoginNotifier loginNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          i == 1?password:repeatPassword,
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
  resetBtn(LoginNotifier loginNotifier) {
    return GestureDetector(
      onTap: () {
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
}