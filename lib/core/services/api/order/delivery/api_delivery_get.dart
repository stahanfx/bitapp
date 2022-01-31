import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/user/api_user_get.dart';
import 'package:dio/dio.dart';
import 'package:bitapp/core/services/api/api_path.dart';

import '../../api_helper.dart';
import 'delivery_model.dart';

class ApiOrderDeliveryGet {
  static Future<DeliveryOrderResponse> deliveryList(
      {required locationCode}) async {
    Future<String> _queryGeneratorGetDelivery(
        {required String locationCode}) async {
      var siteID = AppGlobalSettings.siteId;
      var userID = await ApiUserGet.localUserID();
      return 'SITE_ID=$siteID&=USER_ID=$userID&LOCATION_CODE=$locationCode';
    }

    final client = Dio();
    String query = await _queryGeneratorGetDelivery(locationCode: locationCode);
    String patch = ApiPatchOrderGet.delivery();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    return DeliveryOrderResponse.fromJson(response);
  }
}
