import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool enalbed;
  const LoginButton({
    Key? key,
    this.onTap,
    this.enalbed = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: GestureDetector(
        onTap: enalbed ? onTap : null,
        child: Container(
          alignment: Alignment.center,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.blue),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
