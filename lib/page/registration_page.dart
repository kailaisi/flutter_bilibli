import 'package:bilibli/http/core/hi_error.dart';
import 'package:bilibli/http/dao/login_dao.dart';
import 'package:bilibli/util/string_util.dart';
import 'package:bilibli/widget/app_bar.dart';
import 'package:bilibli/widget/login_effect.dart';
import 'package:bilibli/widget/login_input.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  final VoidCallback? onJumpToLogin;
  RegistrationPage({
    Key? key,
    this.onJumpToLogin,
  }) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool protect = false;
  bool loginEnable = false;
  String? userName;
  String? password;
  String? rePassword;
  String? immocId;
  String? orderId;
  @override
  void initState() {
    super.initState();
    print(userName.isNullOrEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('注册', '登录', () {
        print('登录被点击了');
      }),
      body: Container(
        child: ListView(
          children: [
            LoginEffect(
              protect: protect,
            ),
            LoginInput(
              title: '用户名',
              hint: '请输入用户名',
              onFocusChanged: (value) {
                setState(() {
                  protect = value;
                });
              },
              onChanged: (value) {
                userName = value;
                checkInput();
              },
            ),
            LoginInput(
              title: '密码',
              hint: '请输入密码',
              onChanged: (value) {
                password = value;
                checkInput();
              },
            ),
            LoginInput(
              title: '确认密码',
              hint: '请再次输入密码',
              inputType: TextInputType.visiblePassword,
              onChanged: (value) {
                rePassword = value;
                checkInput();
              },
            ),
            LoginInput(
              title: '慕课ID',
              hint: '请输入慕课网ID',
              inputType: TextInputType.number,
              onChanged: (value) {
                immocId = value;
                checkInput();
              },
            ),
            LoginInput(
              title: '订单号',
              hint: '请输入订单号后四位',
              inputType: TextInputType.number,
              lineStretch: true,
              onChanged: (value) {
                orderId = value;
                checkInput();
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: _loginButton(),
            )
          ],
        ),
      ),
    );
  }

  void checkInput() {
    setState(() {
      loginEnable =
          userName.isNotEmpty && password.isNotEmpty && rePassword.isNotEmpty;
    });
  }

  _loginButton() {
    return InkWell(
      onTap: () {
        if (loginEnable) {
          checkParams();
        } else {}
      },
      child: Text(
        '注册',
        style: TextStyle(color: loginEnable ? Colors.blue : Colors.grey[300]),
      ),
    );
  }

  Future<void> _login() async {
    try {
      var result =
          await LoginDao.registration(userName!, password!, immocId!, orderId!);
      if (result['code'] == 0 && result['data'] != null) {
        widget.onJumpToLogin?.call();
      }
    } on NeedAuth catch (e) {
      print(e);
    } on NeedLogin catch (e) {
      print(e);
    }
  }

  void checkParams() {
    if (password == rePassword) {
      _login();
    } else {
      print('密码不一致');
    }
  }
}
