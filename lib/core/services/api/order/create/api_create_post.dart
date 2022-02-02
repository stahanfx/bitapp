import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/user/api_user_get.dart';
import 'package:bitapp/views/ordering/create/order_create_page.dart';
import 'package:dio/dio.dart';

import '../../api_helper.dart';
import '../../api_path.dart';
import 'order_create_model.dart';

class ApiOrderPost {
  static Future<OrderResponse> order({
    required deliveryId,
    required paymentId,
    required shipmentAddress,
    required userComment,
  }) async {
    Future<String> _queryGeneratorGetDelivery() async {
      var siteID = AppGlobalSettings.siteId;
      var userID = await ApiUserGet.localUserID();
      var userPhone = await ApiUserGet.getUserPhone();
      var userName = await ApiUserGet.getUserName();
      var userEmail = "$userPhone@oui.ru";

      return 'USER_ID=$userID&SITE_ID=$siteID&DELIVERY_ID=$deliveryId&PAYMENT_ID=$paymentId&FIO=$userName&USER_EMAIL=$userEmail&PHONE=$userPhone&SHIPMENT_ADDRESS=$shipmentAddress&USER_COMMENT=$userComment';
    }

    final client = Dio();
    String query = await _queryGeneratorGetDelivery();
    String patch = ApiPatchOrderPost.order();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    return OrderResponse.fromJson(response);
  }
}
