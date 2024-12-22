// ignore_for_file: unnecessary_null_comparison, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_catalog/model/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.red900.make(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Buying not supported yet.".text.make(),
                ));
              },
              child: "Buy".text.color(MyTheme.creamColor).make(),
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(Colors.deepPurple),
              ),
            ).wh(100, 80),
            AddToCart(catalog: catalog).wh(100, 80),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Hero widget for transition effect
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ).h32(context),
            ),
            // Expanding the detail section
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: Colors.teal,
                  width: context.screenWidth,
                  child: SingleChildScrollView( // To handle content overflow
                    child: Column(
                      children: [
                        catalog.name
                            .text
                            .xl4
                            .bold
                            .lg
                            .color(MyTheme.darkBluishColor)
                            .make(),
                        catalog.description
                            .text
                            .xl
                            .textStyle(context.captionStyle)
                            .make(),
                        "Enim irure consequat sit amet deserunt minim dolor pariatur ipsum et adipisicing. Ex ex aliquip qui culpa ea. Reprehend."
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .p16(),
                      ],
                    ).py64(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
