import 'package:flutter/material.dart';

class CurdProvider<T> extends ChangeNotifier {
  final _items = <T>[];

  List<T> get items => List.unmodifiable(_items);

  void delete(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void add(T item) {
    _items.add(item);
    notifyListeners();
  }

  void addAll(List<T> list) {
    _items.addAll(list);
    notifyListeners();
  }

  void update(T item, int index) {
    _items[index] = item;
    notifyListeners();
  }
}
