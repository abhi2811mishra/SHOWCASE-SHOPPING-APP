import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final  int days = 30;
   final String name = "codepur";

    return Scaffold(
      appBar: AppBar(
        title: Text("catalog app"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),//used to changethe app middle settings like colurs etc.


        body: Center(
           child:Container( 
          
            child: Text("Welcome to $days Days of Flutter by $name name"),
          ),
        
      ),
      drawer: MyDrawer(),
    );
  }
}
