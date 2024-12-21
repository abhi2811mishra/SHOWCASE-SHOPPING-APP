// ignore_for_file: unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_catalog/model/cart.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(Theme.of(context).colorScheme.primary).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not suppported yet.".text.make(),
              ));
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.secondary),
            ),
            child: "Buy".text.white.make(),
          ).wh(80, 80)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel(); // Use the singleton instance

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.toList().length,
      itemBuilder: (context, index) {
        final item = _cart.items.toList()[index]; // Convert items to a List for indexing
        return ListTile(
          leading: Icon(Icons.done,color: Theme.of(context).colorScheme.secondary,),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline,color: Theme.of(context).colorScheme.secondary ,),
            onPressed: () {
              setState(() {
                _cart.remove(item); // Remove item from cart
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: '${item.name} removed from cart.'.text.make(),
                ),
              );
            },
          ),
          title: item.name.text.color( Theme.of(context).colorScheme.secondary).bold.xl.make(),
        );
      },
    );
  }
}
