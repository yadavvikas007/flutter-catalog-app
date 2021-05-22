import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';

class CartModel {
  CatalogModel _catalog;
  final List<int> _itemIDs = [];
  //get catalog
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //get items in the list
  List<Item> get items => _itemIDs.map((id) => _catalog.getById(id)).toList();
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIDs.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIDs.remove(item.id);
  }
}
