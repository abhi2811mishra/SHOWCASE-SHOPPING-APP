// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_catalog/model/catalog.dart';

// ignore: use_key_in_widget_constructors
class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item})
      : assert(item != null); //super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          print("${item.name}pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
