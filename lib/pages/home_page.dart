// ignore_for_file: unused_local_variable, sort_child_properties_last, unnecessary_null_comparison, unused_import, avoid_unnecessary_containers, non_constant_identifier_names, use_key_in_widget_constructors, use_super_parameters

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/model/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get elevatedButtonTheme => null;

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

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  // const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        backgroundColor:context.canvasColor,
        floatingActionButton: FloatingActionButton(
        onPressed:()=>Navigator.pushNamed(context,MyRoutes.cartRoute),
        backgroundColor: Theme.of(context).colorScheme.primary,
       child: Icon(CupertinoIcons.cart,color: MyTheme.creamColor,),
        ),



        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().p16().expand()
                else
                   CircularProgressIndicator().centered().expand(),
                  
              ],
            ),
          ),
        )
        );
  }
}










