import 'package:bitapp/core/services/api/basket/basket_api_clients.dart';
import 'package:bitapp/core/services/api/cookie/cookie_jar_model.dart';
import 'package:flutter/material.dart';

class TestModel with ChangeNotifier {
  var model;

  Future getModel() async {
    var data = cookie();
    // model = data.result;
    // notifyListeners();
  }
}
