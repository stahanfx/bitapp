import 'package:bitapp/core/services/api/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../api_helper.dart';
import '../api_path.dart';
import 'api_user_get.dart';

class ApiUserPost {
  static Future localUserId({userId}) async {
    var box = await Hive.openBox('userBox');
    await box.put('userId', userId);
    await box.close();
  }

  static Future localFuserID({required newFuserId}) async {
    var box = await Hive.openBox('userBox');
    await box.put('fuserId', newFuserId);
    await box.close();
  }

  static Future localUserPhone({required userPhone}) async {
    var box = await Hive.openBox('userBox');
    await box.put('userPhone', userPhone);
    await box.close();
  }

  static Future lightRegistration({name, phone}) async {
    _queryGeneratorPostLightRegistration(
        {required name, required phone}) async {
      var password = '${phone}qweqweqwe';
      var oldUserId = await ApiUserGet.fuserID();
      var filterList =
          'USER_EMAIL=$phone@oui.ru&USER_LOGIN=$phone&USER_NAME=$name&USER_PASSWORD=$password&USER_CONFIRM_PASSWORD=$password&PHONE_NUMBER=$phone&OLDFUSER_ID=$oldUserId';
      return filterList;
    }

    final client = Dio();
    String query = await _queryGeneratorPostLightRegistration(
      name: name,
      phone: phone,
    );
    String patch = ApiPatchUserPost.registrations();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = RegistrationResponse.fromJson(response);

    if (responseData.result?.type == 'OK') {
      await ApiUserPost.localFuserID(
          newFuserId: responseData.result?.newFuserId);
      await ApiUserPost.localUserId(userId: responseData.result!.userId);
      await ApiUserPost.localUserPhone(
          userPhone: responseData.result?.userPhone);
    }

    return responseData;
  }
}
