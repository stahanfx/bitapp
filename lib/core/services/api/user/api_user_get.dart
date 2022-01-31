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
    return response;
  }

  static Future localUserID() async {
    var box = await Hive.openBox('userBox');
    int? response = await box.get('userId');
    return response;
  }

  static Future getUserPhone() async {
    print("БОКС Phone ОТКРЫТ");
    var box = await Hive.openBox('userBox');
    String? response = await box.get('userPhone');
    return response;
  }

  static Future<UserModel> userModel() async {
    var userId = await localUserID();
    var fuserId = await fuserID();
    var userPhone = await getUserPhone();
    var result =
        UserModel(userId: userId, fuserId: fuserId, phoneNumber: userPhone);
    return result;
  }
}
