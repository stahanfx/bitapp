import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/order/payment/payment_model.dart';
import 'package:bitapp/core/services/api/user/api_user_get.dart';
import 'package:dio/dio.dart';
import 'package:bitapp/core/services/api/api_path.dart';

import '../../api_helper.dart';

class ApiOrderPaymentGet {
  static Future<PaymentOrderResponse> paymentList({
    required deliveryId,
  }) async {
    Future<String> _queryGeneratorPaymentGet() async {
      var siteID = AppGlobalSettings.siteId;
      var userID = await ApiUserGet.localUserID();
      return 'SITE_ID=$siteID&=USER_ID=$userID&DELIVERY_ID=$deliveryId';
    }

    final client = Dio();
    String query = await _queryGeneratorPaymentGet();
    String patch = ApiPatchOrderGet.payment();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    return PaymentOrderResponse.fromJson(response);
  }
}
