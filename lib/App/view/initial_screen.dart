import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/helpers/widgets.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/assets.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/view/login_screen.dart';
import 'package:cellfio/App/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InitalScreen extends StatefulWidget {
  InitalScreen() : super();

  @override
  _InitalScreenState createState() {
    return _InitalScreenState();
  }
}

class _InitalScreenState extends State<InitalScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bgImage(),
        topLogo(),
        Positioned(bottom: FontSize.size10, child: UI())
      ],
    );
  }

  bgImage() {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          splashBG,
          fit: BoxFit.fitWidth,
        ));
  }

  Widget UI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [bottomUI(), buttons(),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.3,
          top:FontSize.size10),
          child: copyRight(grey2, context,FontWeight.w400),
        )],
    );
  }

  topLogo() {
    return Padding(
      padding: EdgeInsets.only(
          top: FontSize.size100,
          left: MediaQuery.of(context).size.width * 0.25),
      child: Image.asset(cellfioLogo),
    );
  }

  Widget bottomUI() {
    return profileNameDate(false,false);
  }

  buttons() {
    return Row(
      children: [button(1), button(2)],
    );
  }

  button(num i) {
    return GestureDetector(
      onTap: (){
        moveToNextScreen(i);
      },
      child: Padding(
        padding: EdgeInsets.only(left: FontSize.size25, top: FontSize.size20),
        child: Container(
          width: FontSize.size170,
          height: FontSize.size50,
          decoration: BoxDecoration(
              color: i == 1 ? white : blue,
              borderRadius: BorderRadius.all(Radius.circular(FontSize.size6))),
          child: Center(
            child: Text(
              i == 1 ? login : register,
              style: TextStyle(
                  color: i == 1 ? black : white,
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

  void moveToNextScreen(num i) {
    dynamic route=i==1?MaterialPageRoute(builder: (context)=>LoginScreen())
        :MaterialPageRoute(builder:(context)=>RegisterScreen());
    Navigator.push(context, route);
  }
}
