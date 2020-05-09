import 'package:flutter/material.dart';
import 'package:flutterprofile/utils/AppColors.dart';
import 'package:flutterprofile/widgets/svg_loader.dart';

Widget NavigationMenu(icon, {isSelected = false, height, width,onClick}) {
  return InkWell(
    onTap: onClick,
    child: Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          svgLoader(icon, height: height, width: width),
          Container(
            margin: EdgeInsets.all(8),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: isSelected ? navigationSelectionColor : Colors.transparent,
            ),
          )
        ],
      ),
    ),
  );
}
