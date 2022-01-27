import 'package:bitapp/core/services/api/basket/basket_api_clients.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class UserApiGet {
  final client = Dio();

  Future getFuser() async {
    var box = await Hive.openBox('fuserBox');
    if (box.isEmpty) {
      final newFuser = await ApiBasketGet().getFuser();
      box.put('fuser', newFuser.result);
    }
    double response = box.get('fuser');
    box.close();
    return response.ceil();
  }
}
