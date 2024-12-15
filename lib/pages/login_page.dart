import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                // Login Image
                Image.asset(
                  "assets/images/login_page.png",
                  fit: BoxFit.cover,
                  height: 200, // Set a fixed height
                ),
                SizedBox(height: 30.0),

                // Welcome Text
                Text(
                  "WELCOME $name ",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0),

                // Username Field
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter your username",
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    name = value;
                    setState(() {
                      
                    });
                  },
                ),

                SizedBox(height: 20.0),

                // Password Field
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30.0),

                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    backgroundColor: Colors.blueAccent,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
