import 'package:flutter/material.dart';
import 'package:flutterprofile/utils/text_style.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Contact us",style: headerTextStyle,),
            SizedBox(height: 10,),
            _itemWidget("Email","demo@gmail.com"),
            _itemWidget("Mobile","+91 98765 43210"),
          ],
        ),
      ),
    );
  }
  Widget _itemWidget(title,value){
    return Container(
      margin: EdgeInsets.only(top:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style: subHeaderTextStyle,),
          Text(value,style: bodyTextStyle,),
        ],
      ),
    );
  }
}
