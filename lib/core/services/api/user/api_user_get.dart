import 'package:bitapp/core/services/api/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../api_helper.dart';
import '../api_path.dart';

class ApiUserGet {
  static Future<FuserResponse> _serverFuser() async {
    final client = Dio();
    String query = '';
    String patch = ApiPatchUserGet.fuser();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    return FuserResponse.fromJson(response);
  }

  static Future fuserID() async {
    var box = await Hive.openBox('userBox');
    if (box.isEmpty) {
      final newFuser = await ApiUserGet._serverFuser();
      await box.put('fuserId', newFuser.result);
    }
    var response = await box.get('fuserId');
    await box.close();
    return response;
  }

  static Future localUserID() async {
    var box = await Hive.openBox('userBox');
    int? response = await box.get('userId');
    await box.close();
    return response;
  }
}
