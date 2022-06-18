import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterprofile/controller/firebase_controller.dart';
import 'package:flutterprofile/utils/common_string.dart';
import 'package:flutterprofile/utils/text_style.dart';
import 'package:flutterprofile/widgets/app_shimmer_effect.dart';

class HomePage extends StatefulWidget {
  HomePage(this.databaseRef);

  final DatabaseReference databaseRef;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder(
              future: FirebaseController().getFullName(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data, style: headerTextStyle);
                }
                return AppShimmer(
                  child: Text("======= ======", style: headerTextStyle),
                );
              }),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: FutureBuilder(
                future: FirebaseController().getDesignation(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data, style: headerTextStyle);
                  }
                  return AppShimmer(
                    child: Text("==============", style: headerTextStyle),
                  );
                }),
          ),
          FutureBuilder(
              future: FirebaseController().getDescription(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data, style: bodyTextStyle);
                }
                return AppShimmer(
                  child: Text("==============", style: headerTextStyle),
                );
              }),
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
