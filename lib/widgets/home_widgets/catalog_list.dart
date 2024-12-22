// ignore_for_file: use_key_in_widget_constructors, unused_element, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/model/cart.dart';
import 'package:flutter_catalog/model/catalog.dart';
import 'package:flutter_catalog/pages/home_details_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/theme.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailsPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          // Catalog Image with Hero Animation
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image),
          ),
          // Catalog Item Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Item Name
                catalog.name.text.lg
                    .color(Theme.of(context).colorScheme.primary)
                    .bold
                    .xl
                    .make(),
                // Item Description
                catalog.description.text
                    .color(Theme.of(context).colorScheme.primary)
                    .textStyle(context.captionStyle)
                    .make(),
                10.heightBox,
                // OverflowBar with Price, AddToCart, and Buy Button
                OverflowBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  spacing: 10.0,
                  children: [
                    // Price
                    "\$${catalog.price}"
                        .text
                        .color(Theme.of(context).colorScheme.secondary)
                        .bold
                        .xl
                        .make(),
                    // Add to Cart Button
                    AddToCart(catalog: catalog),
                    // Buy Button
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "Buying not supported yet.".text.make(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        shape: const StadiumBorder(),
                      ),
                      child: "Buy".text.color(Colors.white).make(),
                    ),
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
