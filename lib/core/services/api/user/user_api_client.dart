import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/basket/basket_api_clients.dart';
import 'package:bitapp/core/services/api/basket/basket_model.dart';
import 'package:bitapp/core/services/api/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../api_path.dart';

class UserApiGet {
  final client = Dio();

  Future<FuserResponse> getServerFuser() async {
    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchUserGet.getFuser(),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = FuserResponse.fromJson(response);
    return responseData;
  }

  Future getLocalFuser() async {
    var box = await Hive.openBox('fuserBox');
    if (box.isEmpty) {
      final newFuser = await UserApiGet().getServerFuser();
      await box.put('fuser', newFuser.result);
    }
    var response = await box.get('fuser');
    await box.close();
    return response;
  }

  Future getLocalUserId() async {
    var box = await Hive.openBox('fuserBox');
    int? response = await box.get('userId');
    await box.close();
    return response;
  }

  Future postLocalUserId({userId}) async {
    var box = await Hive.openBox('fuserBox');
    await box.put('userId', userId);
    await box.close();
  }

  Future<void> postLocalFuser({required newFuserId}) async {
    var box = await Hive.openBox('fuserBox');
    await box.put('fuser', newFuserId);
    await box.close();
  }
}

class UserApiPost {
  final client = Dio();

  Future postLightRegistration({name, phone}) async {
    _queryGeneratorPostLightRegistration(name, phone) async {
      var password = '${phone}qweqweqwe';
      var oldUserId = await UserApiGet().getLocalFuser();
      var filterList =
          'USER_EMAIL=$phone@oui.ru&USER_LOGIN=$phone&USER_NAME=$name&USER_PASSWORD=$password&USER_CONFIRM_PASSWORD=$password&PHONE_NUMBER=$phone&OLDFUSER_ID=$oldUserId';
      return filterList;
    }

    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchUserAuth.postRegistration(),
      query: await _queryGeneratorPostLightRegistration(name, phone),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = RegistrationResponse.fromJson(response);

    if (responseData.result?.type == 'OK') {
      await UserApiGet()
          .postLocalFuser(newFuserId: responseData.result?.newFuserId);
      await UserApiGet().postLocalUserId(userId: responseData.result!.userId);
    }

    return responseData;
  }
}
