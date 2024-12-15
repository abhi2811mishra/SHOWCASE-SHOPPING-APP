import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //function

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset(
            "assets/images/login_page.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "WELCOME",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter username",
              labelText: "Username",
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Password",
              labelText: "Paasword",
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
            child: Text("login", style: TextStyle(fontSize: 40)),
            style: TextButton.styleFrom(
                minimumSize: Size(150, 100), backgroundColor: Colors.black12),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
          )
        ],
      )),
    );
  }
}
