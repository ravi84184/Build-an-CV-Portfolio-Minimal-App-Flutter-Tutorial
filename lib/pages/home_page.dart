import 'package:flutter/material.dart';
import 'package:flutterprofile/utils/common_string.dart';
import 'package:flutterprofile/utils/text_style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: headerTextStyle),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: Text(
              designation,
              style: subHeaderTextStyle,
            ),
          ),
          Text(
            description,
            style: bodyTextStyle,
          ),
          Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Text(title2, style: headerTextStyle)),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              description,
              style: bodyTextStyle,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Text(title3, style: headerTextStyle)),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: Text(
              description,
              style: bodyTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
