import 'package:flutter/material.dart';

/// 登录动效
class LoginEffect extends StatefulWidget {
  final bool protect;
  const LoginEffect({
    Key? key,
    required this.protect,
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
          Image(
            image: AssetImage('images/logo.png'),
            height: 90,
            width: 90,
          ),
          _image(false),
        ],
      ),
    );
  }

  Widget _image(bool left) {
    var leftImage = widget.protect
        ? 'images/head_left_protect.png'
        : 'images/head_left.png';
    var rightImage = widget.protect
        ? 'images/head_right_protect.png'
        : 'images/head_right.png';
    return Image(
      height: 90,
      image: AssetImage(left ? leftImage : rightImage),
    );
  }
}
