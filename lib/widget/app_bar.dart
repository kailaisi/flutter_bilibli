import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appbar(String title, String rightTitle, VoidCallback? rightButtonClick) {
  return AppBar(
    centerTitle: false,
    titleSpacing: 0,
    leading: BackButton(),
    title: Text(
      title,
      style: TextStyle(fontSize: 18),
    ),
    actions: [
      InkWell(
        onTap: rightButtonClick,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          child: Text(
            rightTitle,
            style: TextStyle(fontSize: 18, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ],
  );
}
