import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/view/profile_screen.dart';
import 'package:cellfio/App/viewModel/profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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