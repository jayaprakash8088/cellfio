import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/view/initial_screen.dart';
import 'package:cellfio/App/viewModel/discover_notifier.dart';
import 'package:cellfio/App/viewModel/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginNotifier()),
      ChangeNotifierProvider(create: (context) => DiscoverNotifier()),
    ],
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: cellfio,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => InitalScreen()},
    );
  }
}
