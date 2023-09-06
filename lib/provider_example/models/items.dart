import 'package:flutter/material.dart';

class Items extends ChangeNotifier {
  final List<int> _items = [];

  List<int> get items => _items;

  void add(int itemNo) {
    _items.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _items.remove(itemNo);
    notifyListeners();
  }
}
