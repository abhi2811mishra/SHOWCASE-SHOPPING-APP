import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //function

    return Material(
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(
              fontSize: 60, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
