import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutterprofile/controller/firebase_controller.dart';
import 'package:flutterprofile/utils/AppColors.dart';
import 'package:flutterprofile/utils/common_string.dart';
import 'package:flutterprofile/utils/text_style.dart';
import 'package:flutterprofile/widgets/app_image_widget.dart';
import 'package:flutterprofile/widgets/app_shimmer_effect.dart';

import '../main.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
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
            new FirebaseAnimatedList(
              query: FirebaseController().getPortfolio(), // line added
              reverse: false,
              shrinkWrap: true,
              defaultChild: AppShimmer(
                child: _itemWidget(width,
                    image: "", name: "===========", description: "==========="),
              ),
              itemBuilder: (_, DataSnapshot snapshot,
                  Animation<double> animation, int x) {
                return _itemWidget(width,
                    image: snapshot.value['image'],
                    name: snapshot.value['name'],
                    description: snapshot.value['description']);
              },
            ),
            /*FutureBuilder(
              future: FirebaseController().getPortfolio().once(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {}

                if (snapshot.hasData) {
                  var list = snapshot.data;
                  return Wrap(
                    children: [
                      for (var model in list.value)
                        _itemWidget(
                          MediaQuery.of(context).size.width * 0.36,
                          image: model['image'],
                          name: model['name'],
                          description: model['description'],
                        )
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            )*/
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(double width, {name, image, description}) {
    return SizedBox(
      width: width,
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
                    child: AppImageWidget(
                      imageUrl: image,
                      fit: BoxFit.fitWidth,
                    ),
                    color: cardBGColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(name, style: subHeaderTextStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5),
                    child: Text(description, style: bodyTextStyle),
                  ),
                ],
              ),
            );
          });
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // color: cardBGColor,
                  // image: DecorationImage(image: Image.network(image).image),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    image,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
