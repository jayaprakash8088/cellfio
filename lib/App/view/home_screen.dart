import 'package:cellfio/App/utils/app_color.dart';
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
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children:[
            DiscoverScreen(),
            SearchView(),
            NewScreen(),
            SettingsScreen(),
            ProfileView()
          ],),
        ),
      );
  }

  menu() {
    return const TabBar(
      labelColor: black,
      unselectedLabelColor: black,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          icon:Icon(Icons.home_outlined),
        ),
        Tab(
          icon: Icon(Icons.search),
        ),
        Tab(
          icon: Icon(Icons.add),
        ),
        Tab(
    icon: ImageIcon(AssetImage('images/settings.png'),
      size: 50.0,
        ),),
        Tab(
          icon: ImageIcon(AssetImage('images/person.png'),
          size: 50.0,),
        ),
      ],
    );
  }
}