import 'package:cellfio/App/viewModel/discover_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen() : super();

  @override
  _DiscoverScreenState createState() {
    return _DiscoverScreenState();
  }
}

class _DiscoverScreenState extends State<DiscoverScreen> {
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
    DiscoverNotifier discoverNotifier = Provider.of<DiscoverNotifier>(context);
    return Scaffold(
      body:PageView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: discoverNotifier.sampleImageList.length,
          itemBuilder: (
          BuildContext context,int index){
        return Image.asset(discoverNotifier.sampleImageList[index],
        fit: BoxFit.cover,);
      }),
    );
  }
}