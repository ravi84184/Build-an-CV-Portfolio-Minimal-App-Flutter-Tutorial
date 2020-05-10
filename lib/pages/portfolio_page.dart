import 'package:flutter/material.dart';
import 'package:flutterprofile/utils/AppColors.dart';
import 'package:flutterprofile/utils/common_string.dart';
import 'package:flutterprofile/utils/text_style.dart';

import '../main.dart';

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Portfolio", style: headerTextStyle),
            Container(
              child: Text(description, style: bodyTextStyle),
              margin: EdgeInsets.only(top: 20, bottom: 10),
            ),
            Row(
              children: <Widget>[
                _itemWidget("1", width),
                _itemWidget("2", width),
                _itemWidget("3", width),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(title, width) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            scaffoldkey.currentState.showBottomSheet((context) {
              return Container(
                color: backgroundLight,
                width: width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 200,
                      alignment: Alignment.center,
                      child:Text(title),
                      color: cardBGColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,top:10),
                      child: Text("Project Name",style:subHeaderTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,top:5),
                      child: Text(description,style:bodyTextStyle),
                    ),
                  ],
                ),
              );
            });
          },
          child: Container(
            margin: EdgeInsets.all(3),
            height: 100,
            color: cardBGColor,
            alignment: Alignment.center,
            child: Text(title),
          ),
        ));
  }
}
