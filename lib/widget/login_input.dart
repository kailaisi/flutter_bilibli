import 'package:bilibli/util/color.dart';
import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  final String title;
  final String hint;

  // 输入数据的变化
  final ValueChanged<String>? onChanged;

  // 焦点变化
  final ValueChanged<bool>? onFocusChanged;

  // 是否是短的下滑线
  final bool lineStretch;

  // 是否是密码输入
  final bool obscureText;

  // 文本输入类型
  final TextInputType? inputType;

  const LoginInput({
    Key? key,
    required this.title,
    required this.hint,
    this.onChanged,
    this.onFocusChanged,
    this.lineStretch = false,
    this.obscureText = false,
    this.inputType,
  }) : super(key: key);

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      widget.onFocusChanged?.call(_focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15),
              width: 100,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            _inputWidget(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: widget.lineStretch ? 15 : 0),
          child: Divider(
            height: 1,
            thickness: 0.5,
          ),
        )
      ],
    );
  }

  Widget _inputWidget() {
    return Expanded(
      child: TextField(
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        keyboardType: widget.inputType,
        autofocus: !widget.obscureText,
        cursorColor: primary,
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ),
    );
  }
}
