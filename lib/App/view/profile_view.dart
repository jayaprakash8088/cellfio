import 'package:cellfio/App/view/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  ProfileView() : super();

  @override
  _ProfileViewState createState() {
    return _ProfileViewState();
  }
}

class _ProfileViewState extends State<ProfileView> {
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
    return Scaffold(
      body: Profile(true),
    );
  }
}