// ignore_for_file: unnecessary_null_comparison, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_catalog/model/catalog.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key?key, required this.catalog})
  :assert(catalog != null),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
                  child: OverflowBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.red900.make(),
                    ElevatedButton(
                      onPressed: () {},
                      child: "Buy".text.color(MyTheme.creamColor).make(),
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.deepPurple)),
                    ).wh(100,80),
                    ElevatedButton(
                      onPressed: () {},
                      child: "Add to Cart".text.color(MyTheme.creamColor).make(),
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.deepPurple)),
                    ).wh(130,80),
                  ],
                                ).p32(),
                ),
    
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
          Hero(
            tag: Key(catalog.id.toString()),
          child: Image.network(catalog.image)
          ).h32(context),
           Expanded(
             child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
              color: Colors.teal,
              width: context.screenWidth,
              child: Column(
                 children: [
                   catalog
                   .name
                   .text.xl4
                   .bold
                   .lg
                   .color(MyTheme.darkBluishColor).make(),

                   catalog
                   .description
                   .text.xl
                   .textStyle(context.captionStyle).make(),
                   "Enim irure consequat sit amet deserunt minim dolor pariatur ipsum et adipisicing. Ex ex aliquip qui culpa ea. Reprehend."
                   .text
                   .textStyle(context.captionStyle)
                   .make()
                   .p16()

                 ],
              ).py64(),
             )
             ),
           )

        ],
        ),
      ),
    );
  }
}
