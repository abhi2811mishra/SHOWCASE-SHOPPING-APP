import 'package:flutter_catalog/model/catalog.dart';

class CartModel {
  // Singleton instance
  static late final CartModel _instance = CartModel._internal();
  CartModel._internal();
  factory CartModel() => _instance;

  // Catalog field
  late CatalogModel _catalogModel;

  final List<int> _itemIds = [];

  // Get catalog
  CatalogModel get catalog => _catalogModel;

  // Set catalog
  set catalog(CatalogModel newCatalog) {
    _catalogModel = newCatalog;
  }

  // Get items in the cart
  Iterable<Item> get items =>
      _itemIds.map((id) => _catalogModel.getById(id)).whereType<Item>();

  // Get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // Add item
  void add(Item item) {
    if (!_itemIds.contains(item.id)) {
      _itemIds.add(item.id);
    }
  }

  // Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
