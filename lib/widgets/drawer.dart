import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageurl =
     "https://thumbs.dreamstime.com/b/holding-hands-against-bright-sun-light-rays-nature-landscape-sunset-blue-sky-yellow-burst-flare-birds-silhouettes-flying-169480456.jpg";

    return Drawer(
      child:Container(
        child: ListView(
          padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              accountName: Text("Abhinav Mishra"),
              accountEmail: Text("abinavmishra61@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
              ),
            )
            ),

            ListTile(
              leading: Icon(
              CupertinoIcons.home,
              color:Colors.black),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ),

             ListTile(
              leading: Icon(
              CupertinoIcons.profile_circled,
              color:Colors.black),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ),

             ListTile(
              leading: Icon(
              CupertinoIcons.settings_solid,
              color:Colors.black),
              title: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ),

            ListTile(
              leading: Icon(
              CupertinoIcons.search_circle,
              color:Colors.black),
              title: Text(
                "Search",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ),

             ListTile(
              leading: Icon(
              CupertinoIcons.mail,
              color:Colors.black),
              title: Text(
                "email me",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ),

      ],
    )
    ),
    );
  }
}
