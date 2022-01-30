import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/order/payment/payment_model.dart';
import 'package:bitapp/core/services/api/user/api_user_get.dart';
import 'package:dio/dio.dart';
import 'package:bitapp/core/services/api/api_path.dart';

import '../../api_helper.dart';

class ApiOrderDeliveryGet {
  static Future<PaymentOrderResponse> paymentList({
    required locationCode,
    required deliveryId,
  }) async {
    Future<String> _queryGeneratorGetPayment() async {
      var siteID = AppGlobalSettings.siteId;
      var userID = await ApiUserGet.localUserID();
      return 'SITE_ID=$siteID&LOCATION_CODE=$locationCode&=USER_ID=$userID&DELIVERY_ID=$deliveryId';
    }

    final client = Dio();
    String query = await _queryGeneratorGetPayment();
    String patch = ApiPatchOrderGet.payment();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    return PaymentOrderResponse.fromJson(response);
  }
}
