import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/helpers/app_bar.dart';
import 'package:cellfio/App/helpers/widgets.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/font_size.dart';
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
      padding:  EdgeInsets.all(FontSize.size15),
      child: Column(
        children: [
          cellfioAppBar(login, context,true),
          noAccountUI(),
          copyRight(black, context, FontWeight.w500)
        ],
      ),
    );
  }
}