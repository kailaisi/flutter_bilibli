import 'package:flutter/material.dart';

/// 登录动效
class LoginEffect extends StatefulWidget {
  final bool protect;
  const LoginEffect({
    Key? key,
    this.protect = false,
  }) : super(key: key);

  @override
  _LoginEffectState createState() => _LoginEffectState();
}

class _LoginEffectState extends State<LoginEffect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _image(true),
        ],
      ),
    );
  }

  _image(bool bool) {}
}
