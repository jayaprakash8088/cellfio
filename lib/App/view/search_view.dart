import 'package:cellfio/App/constants/string_constants.dart';
import 'package:cellfio/App/utils/app_color.dart';
import 'package:cellfio/App/utils/app_config.dart';
import 'package:cellfio/App/utils/font_size.dart';
import 'package:cellfio/App/viewModel/search_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  SearchView() : super();

  @override
  _SearchViewState createState() {
    return _SearchViewState();
  }
}

class _SearchViewState extends State<SearchView> {
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
    SearchNotifier searchNotifier = Provider.of<SearchNotifier>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: FontSize.size24,
            left: FontSize.size15,
            right: FontSize.size15,
            bottom: FontSize.size15),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                searchText,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontFamily: AppConfig.metropolis,
                    fontSize: FontSize.size24,
                    fontWeight: FontWeight.w400,
                    color: black),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: FontSize.size10, bottom: FontSize.size20),
                child: TextFormField(
                    controller: searchNotifier.searchText,
                    decoration: InputDecoration(
                      fillColor: white,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(FontSize.size6)),
                      ),
                      filled: true,
                      counterText: '',
                      hintText: searchAllPhotos,
                      contentPadding: EdgeInsets.only(
                          top: FontSize.size20,
                          bottom: FontSize.size10,
                          left: FontSize.size10,
                          right: FontSize.size10),
                      // add padding to adjust text
                      isDense: true,
                    )),
              ),
              Text(
                "102 $results",
                style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w900,
                    fontFamily: AppConfig.metropolis,
                    fontStyle: FontStyle.normal,
                    fontSize: FontSize.size13),
              ),
              gallery()
            ],
          ),
        ),
      ),
    );
  }

  gallery() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: GridView.builder(
            itemCount: 15,
            scrollDirection: Axis.vertical,
            physics:
                const AlwaysScrollableScrollPhysics(parent: ScrollPhysics()),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(FontSize.size5),
                child: Image.asset(
                  'images/img.png',
                  height: FontSize.size106,
                  width: FontSize.size106,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: FontSize.size5, bottom: FontSize.size5),
          child: Container(
            width: MediaQuery.of(context).size.width*0.9,
            height: FontSize.size50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(FontSize.size6)),
              color: white,
              border: Border.all(color:black)
            ),
            child: Center(child: Text(seeMore,
              style: TextStyle(
                  color:black,
                  decoration: TextDecoration.none,
                  fontFamily: AppConfig.metropolis,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: FontSize.size14),)),
          ),
        )
      ],
    );
  }
}
