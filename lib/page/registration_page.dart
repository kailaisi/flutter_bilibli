import 'package:bilibli/widget/app_bar.dart';
import 'package:bilibli/widget/login_input.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('注册', '登录', () {
        print('登录被点击了');
      }),
      body: Container(
        child: ListView(
          children: [
            LoginInput(
              title: '用户名',
              hint: '请输入用户名',
              onFocusChanged: (value) {
                print(value);
              },
            ),
            LoginInput(
              title: '密码',
              hint: '请输入密码',
              lineStretch: true,
            ),
          ],
        ),
      ),
    );
  }
}
