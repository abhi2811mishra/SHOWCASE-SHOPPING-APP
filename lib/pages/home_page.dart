// ignore_for_file: unused_local_variable, sort_child_properties_last, unnecessary_null_comparison, unused_import, avoid_unnecessary_containers, non_constant_identifier_names, use_key_in_widget_constructors, use_super_parameters

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatlogItem(
          catalog: catalog,
        );
      },
    );
  }
}

class CatlogItem extends StatelessWidget {
  final Item catalog;

  const CatlogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image: catalog.image,
          ),
         Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(MyTheme.darkBluishColor).make(),
              catalog.description.text.textStyle(context.captionStyle).make(),
              OverflowBar(
                alignment: MainAxisAlignment.spaceBetween,
               
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    
                    onPressed: (){},
                    
                     child: "Buy".text.color(MyTheme.creamColor).make(),

                     style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.deepPurple)
                     ), 
                     ),
                ],
              )
              
            ],
         ),
         )

      ],
    )
    ).white.rounded.square(150).make();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
            .box
            .roundedSM
            .p16
            .color(MyTheme.creamColor)
            .make()
            .w40(context);
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}
