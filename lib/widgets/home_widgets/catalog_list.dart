// ignore_for_file: unnecessary_null_comparison, use_super_parameters, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/model/catalog.dart';
import 'package:flutter_catalog/pages/home_details_page.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(context,
           MaterialPageRoute(builder
           : (context)=>HomeDetailsPage(catalog: catalog)
           )
           ),

          child: CatlogItem(catalog: catalog),
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
        Hero(
          tag:Key(catalog.id.toString()) ,
          child:CatalogImage(
            image: catalog.image,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              catalog.name.text.bold.lg.color(Theme.of(context).colorScheme.primary).make(),
              catalog.description.text.textStyle(context.captionStyle).color(Theme.of(context).colorScheme.primary).make(),
              OverflowBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl.make().color(Theme.of(context).colorScheme.primary),
                  ElevatedButton(
                    onPressed: () {},
                    child: "Buy".text.color(MyTheme.creamColor).make(),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.deepPurple)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: "Add to Cart".text.color(MyTheme.creamColor).make(),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.deepPurple)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    )).color(context.cardColor).rounded.square(150).make();
  }
}
