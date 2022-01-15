import 'package:cellfio/App/utils/assets.dart';
import 'package:cellfio/App/view/discover_screen.dart';
import 'package:cellfio/App/view/new_screen.dart';
import 'package:cellfio/App/view/profile_view.dart';
import 'package:cellfio/App/view/search_view.dart';
import 'package:cellfio/App/view/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super();

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
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
    return DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          bottomNavigationBar: menu(),
          body: TabBarView(children:[
            DiscoverScreen(),
            SearchView(),
            NewScreen(),
            SettingsScreen(),
            ProfileView()
          ]),
        ),
      );
  }

  menu() {
    return const TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          text: '',
        ),
        Tab(
          icon: Icon(Icons.assignment),
        ),
        Tab(
          icon: Icon(Icons.account_balance_wallet),
        ),
        Tab(
          icon: Icon(Icons.settings),
        ),
        Tab(
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}