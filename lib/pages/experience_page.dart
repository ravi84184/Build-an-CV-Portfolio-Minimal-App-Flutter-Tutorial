import 'package:flutter/material.dart';
import 'package:flutterprofile/utils/AppColors.dart';
import 'package:flutterprofile/utils/common_string.dart';
import 'package:flutterprofile/utils/text_style.dart';

class ExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Professional Experience",
              style: headerTextStyle,
            ),
            SizedBox(height: 10,),
            _itemWidget("20 April, 2020", description),
            _itemWidget("20 April, 2020", description),
            _itemWidget("20 April, 2020", description),
            _itemWidget("20 April, 2020", description),
            _itemWidget("20 April, 2020", description),
            _itemWidget("20 April, 2020", description),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(title, description) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.only(right: 10),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
              Text(
                title,
                style: subHeaderTextStyle,
              )
            ],
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(left: 6,top: 10),
            decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 2, color: Colors.grey))),
            child: Container(
              height: 100,
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: cardBGColor
              ),
              child: Text(description),
            ),
          )
        ],
      ),
    );
  }
}
