import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutterprofile/controller/firebase_controller.dart';
import 'package:flutterprofile/utils/AppColors.dart';
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
            SizedBox(
              height: 10,
            ),
            FirebaseAnimatedList(
              shrinkWrap: true,
              query: FirebaseController().getExperience(),
              itemBuilder: (_, DataSnapshot snapshot,
                  Animation<double> animation, int x) {
                print(snapshot.value);
                if (snapshot != null)
                  return _itemWidget(
                      snapshot.value['date'], snapshot.value['description']);
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(title, description) {
    return Container(
      width: double.infinity,
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
            margin: EdgeInsets.only(left: 6, top: 10),
            decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 2, color: Colors.grey))),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: cardBGColor),
              child: Text(description),
            ),
          )
        ],
      ),
    );
  }
}
