

// ignore_for_file: unused_local_variable, sort_child_properties_last, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/model/catalog.dart';

import 'package:flutter_catalog/widgets/drawer.dart';
//import 'package:flutter_catalog/widgets/item_widget.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
  
   CatalogModel.items=List.from(productData).map<Item>((item)=>Item.fromMap(item)).toList();

   setState(() {
     
   });
  }

  // const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "codepur";
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Portfolio App",
        ),
        centerTitle: true,
      ), //used to changethe app middle settings like colurs etc.


      body: Padding(padding: const EdgeInsets.all(16.0),
     
        child:(CatalogModel.items!= null && CatalogModel.items.isNotEmpty)? 
         GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 16,crossAxisSpacing: 16) , 
           itemBuilder:(context,index){
           final item = CatalogModel.items[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child : GridTile(
            // ignore: avoid_unnecessary_containers
            header: Container(
              child: Text(item.name,style: TextStyle(color: Colors.white),),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:Colors.deepPurple,
              ),
              
              ),
            
            child: Image.network(item.image),
            footer:Container(
              child: Text(item.price.toString(),style: TextStyle(color: Colors.black),),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:Colors.cyanAccent,
              ),
              
              ), 
            
            
            )
            );
        },
        itemCount: CatalogModel.items.length,
         )
      :Center(
        child: CircularProgressIndicator(),
      ),
      
      
    ),
    drawer: MyDrawer(),
    );
  }
 






  get toList => null;
}
