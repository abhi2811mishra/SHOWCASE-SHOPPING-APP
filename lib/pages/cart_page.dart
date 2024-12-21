// ignore_for_file: unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_catalog/model/cart.dart';
import 'package:flutter_catalog/model/catalog.dart';
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
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartModel();

    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${cart.totalPrice}", // Reflects the updated total price
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Buying not supported yet."),
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: const StadiumBorder(),
              minimumSize: const Size(80, 40),
            ),
            child: const Text("Buy", style: TextStyle(color: Colors.white)),
          ),
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
  final  _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? Center(
            child: Text(
              "Nothing to Show.",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              final item = _cart.items.toList()[index];
              return ListTile(
                leading: Icon(Icons.done,
                    color: Theme.of(context).colorScheme.secondary),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline,
                      color: Theme.of(context).colorScheme.secondary),
                  onPressed: () {
                    setState(() {
                      _cart.remove(item); // Removes the item and adjusts total
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('${item.name} removed from cart.'),
                    ));
                  },
                ),
                title: Text(
                  item.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
              );
            },
          );
  }
}
