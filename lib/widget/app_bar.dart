import 'package:bilibli/util/view_util.dart';
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

videoBar({VoidCallback? onBack}) {
  return Container(
    padding: EdgeInsets.only(right: 8),
    decoration: BoxDecoration(gradient: blackLinearGradint(formTop: true)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BackButton(
          color: Colors.white,
        ),
        Row(
          children: [
            Icon(
              Icons.live_tv_rounded,
              color: Colors.white,
              size: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
