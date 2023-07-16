import 'package:flutter/cupertino.dart';

class ItemScrollProvider extends ChangeNotifier {
  List<int> _visibleItems = [];

  List<int> get visibleItems => _visibleItems;

  void setVisibleItems(List<int> list) {
    _visibleItems = list;
    notifyListeners();
  }

  int getLastItem() {
    return _visibleItems.isEmpty ? 0 : _visibleItems.last;
  }

  int getFirstItem() {
    return _visibleItems.isEmpty ? 0 : _visibleItems.first;
  }
}
