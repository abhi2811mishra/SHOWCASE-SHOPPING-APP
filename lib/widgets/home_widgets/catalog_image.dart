

// ignore_for_file: use_super_parameters, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:cached_network_image/cached_network_image.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
    )
        .box
        .roundedSM
        .p16
        .color(context.canvasColor)
        .make()
        .w40(context); // Maintains the width customization
  }
}
