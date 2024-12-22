// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/widgets/drawer.dart' as drawer_widget;
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centers content vertically
        crossAxisAlignment: CrossAxisAlignment
            .center, // Aligns content to the center horizontally
        children: [
         
          SizedBox(height: 8), // Adds spacing
          "Trending Products"
              .text
              .xl2
              .color(Theme.of(context).colorScheme.secondary)
              .make(),
        ],
      ),
    );
  }
}
