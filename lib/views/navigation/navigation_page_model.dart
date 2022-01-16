import 'package:flutter/material.dart';

class NavigationPageModel with ChangeNotifier {
  late int basketCount = 0;

  Future<void> getCatalog(filter, select) async {
    notifyListeners();
  }

  void clearCatalog() {
    notifyListeners();
  }
}
