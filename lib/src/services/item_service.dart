import 'package:flutter_template/src/data/models/item_model.dart';

class ItemService {
  final List<Item> _items = [];

  List<Item> get items => _items;

  int get length => _items.length;

  void add(Item item) {
    _items.add(item);
  }

  void addAll(List<Item> items) {
    _items.addAll(items);
  }

  void clear() {
    _items.clear();
  }

  void delete(String id) {
    _items.removeWhere((element) => element.id == id);
  }
}
