import 'package:bilibli/http/core/hi_error.dart';
import 'package:bilibli/http/dao/login_dao.dart';
import 'package:bilibli/http/request/login_request.dart';
import 'package:bilibli/util/string_util.dart';
import 'package:bilibli/util/toast.dart';
import 'package:bilibli/widget/app_bar.dart';
import 'package:bilibli/widget/login_button.dart';
import 'package:bilibli/widget/login_effect.dart';
import 'package:bilibli/widget/login_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? userName;
  String? password;
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    print('enabled:${enable}');
    return Scaffold(
      appBar: appbar('登录', '注册', null),
      body: ListView(
        children: [
          LoginEffect(protect: false),
          LoginInput(
            title: '账号',
            hint: '请输入账号',
            onChanged: (value) {
              userName = value;
              check();
            },
          ),
          LoginInput(
            title: '密码',
            hint: '请输入密码',
            onChanged: (value) {
              password = value;
              check();
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: LoginButton(
              title: '登录',
              enalbed: enable,
              onTap: () {
                print('onTab');
                _login();
              },
            ),
          )
        ],
      ),
    );
  }

  void _login() {
    var request = LoginRequest();
    request.add('userName', userName!).add('passwrod', password!);
    try {
      var result = LoginDao.login(userName!, password!);
      print('_LoginPageState._login:${(result.toString())}');
      if (result?['code'] == 0) {
        showToast('登录成功');
      } else {
        showToast(result['msg']);
      }
    } on NeedAuth catch (e) {
      print(e);
      showWarningToast(e.message);
    } on HiNetError catch (e) {
      print(e);
      showWarningToast(e.message);
    }
  }

  void check() {
    setState(() {
      enable = !userName.isNullOrEmpty && !password.isNullOrEmpty;
    });
  }
}
